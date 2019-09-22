#!/usr/bin/python3
#-*- coding: utf-8 -*-

from typing import List

from intshell import IntShell
from gui import Gui


class Pish():
    """
    :type ls_ish: List[IntShell]
    """
    def __init__(self) -> None:
        self.gui = Gui(self)
        self.ls_ish = list()

    def add_intshell(self, ish: IntShell):
        self.ls_ish.append(ish)
        self.gui.add_tab(ish.name)

    def start(self):
        assert len(self.ls_ish) == len(self.gui.ls_tab)

        self.update()
        self.gui.start()

    def update(self):
        assert len(self.ls_ish) == len(self.gui.ls_tab)

        self.gui.root.after(500, self.update)

        for (i, ish) in enumerate(self.ls_ish):
            ish.update()
            tab = self.gui.ls_tab[i]

            for stderr in ish.ls_stderr:
                tab.output('<err> ' + stderr)
            for stdout in ish.ls_stdout:
                tab.output('<out> ' + stdout)

    def kill(self):
        for ish in self.ls_ish:
            ish.kill()

    def _proc_tab_input(self, tab_id: int, msg: str) -> None:
        ish = self.ls_ish[tab_id]
        ish.send_cmd(msg)


if __name__ == '__main__':
    ish = IntShell('test intshell with tclsh', r'tclsh ./test/test_intshell.tcl', log_fpath='', is_verbose_log=True)
    pish = Pish()
    pish.add_intshell(ish)
    pish.start()
