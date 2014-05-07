#!/usr/bin/env python

import sqlite3


class Sleep(object):
    def __init__(filename):
        self.filename = filename
        self.con = sqlite3.connect(filename)
        


def parse(filename):
    sleepdata = Sleep(filename)
    sleepdata.parse()


if __name__ == '__main__':
    filename = 'data/f2c74a8ab2a40bdae1796ae48dc47e19a69a52b0'
    parse(filename)