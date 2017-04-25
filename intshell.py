#!/usr/bin/python3
#-*- coding: utf-8 -*-

import re
import time
import enum
import queue
import subprocess
import shlex
import threading
from typing import List, Union, Callable


class IntShell():
    """# interactive shell

    ## feature
    - start shell command in separate process
    - monitor shell's output
        - change status according to flag line
    - send commands to this shell
        - delibrate insert message for flow control info exchange

    ## flow control info exchange
    - info options
        - CMD_START : command started
        - CMD_END   : command finished
        - EOF       : get EOF from both stdout & stderr pipes
    - info line
        - embedded in stdout for flow control info exchange
        - format: '<<PISH::' + info + '>>'

    ## status state machine
                          +-----CMD_START----+
                          V                  |
    [INIT] --start()-> [BUSY] --CMD_END-> [IDLE] --EOF-> [EXIT]
                          |
                          +--(_cntr_idle > timeout_cycle)-> [TIMEOUT]

    # usage
    1. ish = IntShell('name', 'tclsh')
    2. (optional if is_auto_start=False) ish.start()
    3. ish.update()
    4. analyze ish.ls_stdout and ish.ls_stderr, and response with ish.send_cmd(cmd) or ish.send_exit()
        - after send_cmd/send_exit, the actual command is buffered, waiting for next update() to send it to shell while IDLE/TIMEOUT
        - every update() only send 1 command
    5. repeat step 3 and 4 every 100ms
        - waiting for status changing to EXIT
    """

    class PipeMonitor():
        """
        Create thread that monitors output pipe
        """
        def __init__(self, name, pipe):
            self.name = name
            self.q = queue.Queue()  # use queue to store message from pipe

            def _monitor_pipe(_p, _q):
                while True:
                    line = _p.readline()
                    if line:
                        _q.put(line)
                        print(line)
                    else:
                        _q.put(None)
                        return

            # start monitor thread for pipe
            self.thread = threading.Thread(target=_monitor_pipe, args=(pipe, self.q))
            self.thread.daemon = True
            self.thread.start()

    def __init__(self, name: str, start_cmd: str, log_fpath: str = '', is_verbose_log: bool = False, timeout_cycle: int = 6000, is_auto_start: bool = True):

        self.name = name
        self.start_cmd = start_cmd

        self.is_verbose_log = is_verbose_log
        if (log_fpath == ''):
            self.f_log = None
        else:
            self.f_log = open(log_fpath, 'w')
        self._init_time = self._current_time()

        self.timeout_cycle = timeout_cycle

        self.status = 'INIT'

        self.ls_stdout = list()
        self.ls_stderr = list()
        self.ls_stdin  = list()

        self._cntr_idle_stdout = 0
        self._cntr_idle_stderr = 0
        self._cntr_idle = 0

        self._cntr_eof = 0
        self.is_eof = False

        if (is_auto_start):
            self.start()

        self._log('init')

    def __del__(self):
        self.kill()
        if (self.f_log is not None):
            self.f_log.close()

    def __str__(self):
        return '%s[STATUS=%s]' % (self.name, self.status.name)

    def start(self) -> None:
        self._log('start')

        # start the shell thread using start_cmd
        ls_cmd = shlex.split(self.start_cmd)
        self.sp = subprocess.Popen(ls_cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        self._log('  popen ' + repr(ls_cmd))

        # create monitor threads for output pipes
        self._stderr_monitor = self.PipeMonitor('stderr', self.sp.stderr)
        self._stdout_monitor = self.PipeMonitor('stdout', self.sp.stdout)

        self.status = 'BUSY'

    def update(self) -> None:
        """
        will be called every cycle
        """
        self._log('update')

        self.ls_stderr += self._copy_from_monitor(self._stderr_monitor)
        self.ls_stdout += self._copy_from_monitor(self._stdout_monitor)

        self._proc_info_line()
        self._proc_timeout()
        self._proc_eof()

        self._send_stdin()

    def send_cmd(self, cmd: str) -> None:
        self._log('send_cmd ' + cmd)

        cmd = 'echo "%s"; %s; echo "%s";\n' % (self._gen_flag_line('CMD_START'), cmd, self._gen_flag_line('CMD_END'))
        self.ls_stdin.append(cmd)

    def send_exit(self) -> None:
        self.ls_stdin.append('exit\n')

    def kill(self):
        self.sp.kill()

    #===========================================================
    # private methods
    #===========================================================

    def _copy_from_monitor(self, monitor: PipeMonitor) -> List[str]:
        """
        Copy message lines from monitor's queue to list
        :param monitor: pipe monitor instance
        :return:
        """
        self._log('  copy from monitor ' + monitor.name)
        ls = list()
        while (not monitor.q.empty()):
            try:
                line = monitor.q.get_nowait()
                if (line is None):
                    # EOF
                    self._cntr_eof += 1
                    if (self._cntr_eof == 2):
                        self.is_eof = True
                    self._log('[' + monitor.name + '] EOF')
                else:
                    line = line.decode('ascii')
                    line = line.splitlines()[0]
                    ls.append(line)
                    self._log('[' + monitor.name + '] ' + line)
            except queue.Empty:
                break
        return ls

    @staticmethod
    def _get_info(line: str) -> Union[None, str]:
        _regexp_info_line = re.compile(r'^<<PISH::([_A-Z]+)>>$')
        m = _regexp_info_line.fullmatch(line)
        if (m):
            return m.group(1)
        else:
            return None

    def _proc_info_line(self) -> None:
        ls = list()
        for line in self.ls_stdout:
            info = self._get_info(line)
            if (info is None):
                # not info line
                ls.append(line)
                continue

            is_unexpected = False
            if (self.status == 'BUSY'):
                if (info == 'CMD_END'):
                    self.status = 'IDLE'
                    self._log('  status BUSY --CMD_END-> IDLE')
                else:
                    is_unexpected = True
            elif (self.status == 'IDLE'):
                if (info == 'CMD_START'):
                    self.status = 'BUSY'
                    self._log('  status IDLE --CMD_START-> BUSY')
                else:
                    is_unexpected = True

            if (is_unexpected):
                self._log('Warning: info = %s while status = %s' % (self.status, info))

        self.ls_stdout = ls

    def _proc_timeout(self) -> None:
        if (self.status == 'BUSY'):
            if self._stdout_monitor.q.empty():
                self._cntr_idle_stdout += 1
            if self._stderr_monitor.q.empty():
                self._cntr_idle_stderr += 1

            self._cntr_idle = self._cntr_idle_stdout if (self._cntr_idle_stdout <= self._cntr_idle_stdout) else self._cntr_idle_stderr
            if (self._cntr_idle >= self.timeout_cycle):
                self.status = 'TIMEOUT'
                self._log('  status BUSY ---> TIMEOUT')
        else:
            self._cntr_idle_stdout = 0
            self._cntr_idle_stderr = 0
            self._cntr_idle = 0

    def _proc_eof(self) -> None:
        if (self.is_eof):
            if (self.status != 'IDLE'):
                self._log('Warning: EOF while status is %s not IDLE' % (self.status))
            self._log('  status %s --EOF-> EXIT' % self.status)
            self.status = 'EXIT'

    def _send_stdin(self) -> None:
        if (self.status in ['IDLE', 'TIMEOUT']):
            if (self.status == 'TIMEOUT'):
                self._log('Warning: send stdin while status is TIMEOUT')
            if (len(self.ls_stdin) > 0):
                line = self.ls_stdin.pop(0)
                self.sp.stdin.write(bytes(line, "ascii"))
                self.sp.stdin.flush()
                self._log('[stdin]  ' + line)

    @staticmethod
    def _gen_flag_line(flag: str) -> str:
        return '<<PISH::' + flag + '>>'

    @staticmethod
    def _current_time():
        return int(time.time() * 1000)

    def _log(self, msg: str) -> None:
        msg = msg.rstrip('\n')
        if (self.is_verbose_log):
            t = self._current_time() - self._init_time
            msg = '<<PISH>>@%6d  %s' % (t, msg)
        else:
            msg = '<<PISH>>  ' + msg
        if (self.f_log is not None):
            self.f_log.write(msg + '\n')
        print(msg)

if __name__ == '__main__':
    ish = IntShell('test intshell with tclsh', r'tclsh ./test/test_intshell.tcl', log_fpath='', is_verbose_log=True, timeout_cycle=60, is_auto_start=False)

    ish.start()

    ish.update()
    time.sleep(0.5)
    ish.update()
