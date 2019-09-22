#!/usr/bin/python36
#-*- coding: utf-8 -*-

from tkinter import ttk
import tkinter as tk
import tkinter.scrolledtext as tkst
import tkinter.font as tkft
from typing import Callable


class Tab():
    def __init__(self, parent: 'Gui', tab_id: int):
        self.parent = parent
        self.tab_id = tab_id

        self.frame = ttk.Frame(self.parent.root)

        self.text = tkst.ScrolledText(self.frame, bg='#F0F0F0', relief=tk.FLAT, wrap=tk.WORD, state=tk.DISABLED)
        self.text.pack(expand=1, fill=tk.BOTH)
        self.text.bind('<FocusIn>', lambda e: self.entry.focus_set())  # whenever ScrolledText gets focus, change focus to Entry

        self.entry = tk.Entry(self.frame)
        self.entry.pack(side=tk.BOTTOM, fill=tk.X, anchor=tk.W)
        self.entry.bind('<Return>', func=self._bind_entry_on_return)
        self.entry.bind('<Key>', func=self._bind_entry_on_any_key)

        self.entry.focus_set()

    def output(self, msg):
        self.text.config(state=tk.NORMAL)
        self.text.insert(tk.END, msg + '\n')
        self.text.config(state=tk.DISABLED)
        self.text.see(tk.END)

    def _bind_entry_on_return(self, event):
        msg = self.entry.get()
        self.output('>>> ' + msg)
        self.entry.delete(0, last=tk.END)
        self.parent.parent._proc_tab_input(self.tab_id, msg)

    def _bind_entry_on_any_key(self, event):
        # print('[GUI] ' + repr(event))

        is_ctrl = ((event.state & 0x4) != 0)
        # # is_alt  = (((event.state & 0x8) != 0) or ((event.state & 0x80) != 0))
        # # is_shift= ((event.state & 0x1) != 0)

        if (is_ctrl):
            if (48 <= event.keycode <= 57):
                tab_id = event.keycode - 48 - 1
                if (tab_id == -1):
                    tab_id = 9
                self.parent.switch_tab(tab_id)


class Gui():
    def __init__(self, parent: 'Pish') -> None:
        self.parent = parent

        self.root = tk.Tk()
        self.root.title('PISH (Parallel Interactive Shell)')
        # default_font = tkft.Font(family='courier', size=10)
        # self.root.option_add('*Font', default_font)
        self.root.option_add('*Font', 'courier 10')
        self.root.protocol("WM_DELETE_WINDOW", func=self.kill)

        self.notebook = ttk.Notebook(self.root, takefocus=False)
        self.notebook.bind('<FocusIn>', func=self._notebook_focus_in)

        self.ls_tab = list()
        self.active_tab_id = -1

    def kill(self) -> None:
        self.parent.kill()
        self.root.destroy()

    def add_tab(self, name: str = '') -> None:
        tab_id = len(self.ls_tab)
        tab = Tab(self, tab_id)
        self.ls_tab.append(tab)

        if (name == ''):
            name = 'TAB-%d' % tab_id
        else:
            if (len(name) > 8):
                name = name[:8]

        self.notebook.add(tab.frame, text=name)

    def start(self):
        self.switch_tab(0)
        self.notebook.pack(expand=1, fill=tk.BOTH)
        self.root.mainloop()

    def switch_tab(self, tab_id: int) -> None:
        print('[GUI] switch to tab %d' % tab_id)
        self.notebook.select(tab_id)
        self.active_tab_id = tab_id
        self._notebook_focus_in(None)

    def rename_tab(self, tab_id: int, name: str) -> None:
        self.notebook.tab(tab_id, text=name)

    def _update(self, update_func: Callable[[], None]) -> None:
        update_func()
        self.root.after(100, self._update, update_func)

    def _notebook_focus_in(self, event) -> None:
        # change focus to active tab's entry
        self.ls_tab[self.active_tab_id].entry.focus_set()

if __name__ == '__main__':
    class FakePish():
        def _proc_tab_input(self, tab_id, input):
            pass

        def kill(self):
            pass

    fake_pish = FakePish()
    gui = Gui(fake_pish)
    gui.add_tab()
    gui.add_tab()
    gui.add_tab()
    gui.add_tab()
    gui.start()
