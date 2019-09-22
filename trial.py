#
# import subprocess
# import shlex
# import sys
# import os
#
# from threading import Thread
# from queue import Queue, Empty
#
#
# class NonBlockingStreamReader:
#     def __init__(self, stream):
#         '''
#         stream: the stream to read from.
#                 Usually a process' stdout or stderr.
#         '''
#
#         self._s = stream
#         self._q = Queue()
#
#         def _populateQueue(stream, queue):
#             '''
#             Collect lines from 'stream' and put them in 'quque'.
#             '''
#
#             while True:
#                 line = stream.readline()
#                 if line:
#                     queue.put(line)
#                 else:
#                     # raise UnexpectedEndOfStream
#                     queue.put(0)
#                     return
#
#         self._t = Thread(target = _populateQueue,
#                 args = (self._s, self._q))
#         self._t.daemon = True
#         self._t.start() #start collecting lines from the stream
#
#     def readline(self, timeout = None):
#         try:
#             return self._q.get(block = timeout is not None,
#                     timeout = timeout)
#         except Empty:
#             return None
#
# class UnexpectedEndOfStream(Exception): pass
#
# # p = subprocess.Popen(shlex.split("tclsh"), stdin=sys.stdin, stdout=sys.stdout, stderr=sys.stderr)
# # p = subprocess.Popen(shlex.split("tclsh ./test/init.tcl"), stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
# p = subprocess.Popen(["python", "./test/shell.py"], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=False)
#
# nbsr = NonBlockingStreamReader(p.stdout)
# p.stdin.write(b'puts abc;\n')
#
# while True:
#     out = nbsr.readline(0.5)
#     p.stdin.write(b'puts abc;\n')
#
#     if not out:
#         # print('no data')
#         p.stdin.write(b'puts abc; flush;\n')
#     else:
#         if (out == 0):
#             break
#         print('<' + out + '>')

from __future__ import print_function

import subprocess
import shlex
import sys
import os

from threading import Thread
from queue import Queue, Empty


class NonBlockingStreamReader:
    def __init__(self, stream):
        '''
        stream: the stream to read from.
                Usually a process' stdout or stderr.
        '''

        self._s = stream
        self._q = Queue()

        def _populateQueue(stream, queue):
            '''
            Collect lines from 'stream' and put them in 'quque'.
            '''

            while True:
                line = stream.readline()
                if line:
                    queue.put(line)
                else:
                    # raise UnexpectedEndOfStream
                    queue.put(0)
                    return

        self._t = Thread(target = _populateQueue,
                         args = (self._s, self._q))
        self._t.daemon = True
        self._t.start() #start collecting lines from the stream

    def readline(self, timeout = None):
        try:
            return self._q.get(block = timeout is not None,
                               timeout = timeout)
        except Empty:
            return None

class UnexpectedEndOfStream(Exception): pass

# subprocess.call(shlex.split("python3 ./test/shell.py"), stdin=sys.stdin, stdout=sys.stdout, stderr=sys.stderr)
p = subprocess.popen(shlex.split("python3 ./test/shell.py"), stdin=subprocess.pipe, stdout=subprocess.pipe, stderr=sys.stderr)
# p = subprocess.Popen(shlex.split("tclsh ./test/init.tcl"), stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
# p = subprocess.Popen(["python", "./test/shell.py"], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=False)
# while True:
#     p.stdin.write('abc\n')

nbsr = NonBlockingStreamReader(p.stdout)
p.stdin.write(bytes('puts abc;\n', "ascii"))
p.stdin.flush()

while True:
    out = nbsr.readline(0.5)

    if not out:
        p.stdin.write(b'puts abc\n')
        p.stdin.flush()
    else:
        if (out == 0):
            break
        print('<' + out.rstrip('\n') + '>')
