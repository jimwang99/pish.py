#!/usr/bin/python3
#-*- coding: utf-8 -*-

import time

from intshell import IntShell


class TestIntShell():
    def setup(self):
        self.ish = IntShell('test intshell with tclsh', r'tclsh ./test/test_intshell.tcl', log_fpath='', is_verbose_log=True, timeout_cycle=60, is_auto_start=False)

    def test_start(self):
        assert self.ish.status == 'INIT'

        self.ish.start()
        assert self.ish.status == 'BUSY'

        self.ish.update()
        assert len(self.ish.ls_stdout) == 0
        assert len(self.ish.ls_stderr) == 0

        time.sleep(0.5)

        self.ish.update()
        assert self.ish.ls_stdout == ['init: start', 'init: intermediate', 'init: end']
        assert self.ish.ls_stderr == ['init: error message']

    def test_send_cmd(self):
        self.ish.start()

        time.sleep(0.5)

        self.ish.update()
        self.ish.ls_stdout.clear()
        self.ish.ls_stderr.clear()

        self.ish.send_cmd('run stage1 0.2')
        self.ish.update()

        time.sleep(0.5)
        self.ish.update()
        assert self.ish.ls_stdout == ['stage1: start', 'stage1: intermediate', 'stage1: end']
        assert self.ish.ls_stderr == ['stage1: error message']

    def test_eof(self):
        self.ish.start()

        time.sleep(0.5)

        self.ish.update()
        self.ish.ls_stdout.clear()
        self.ish.ls_stderr.clear()

        self.ish.send_exit()
        self.ish.update()

        time.sleep(0.5)
        self.ish.update()
        assert len(self.ish.ls_stdout) == 0
        assert len(self.ish.ls_stderr) == 0
