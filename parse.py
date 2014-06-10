#!/usr/bin/env python

import sqlite3
import dataset


# class Sleep(object):
#     def __init__(filename):
#         self.filename = filename
#         self.con = sqlite3.connect(filename)
#         
# 
# 
# def parse(filename):
#     sleepdata = Sleep(filename)
#     sleepdata.parse()

def debug():
    db = dataset.connect('sqlite:///data/current.sqlite')
    for item in db['ZLOG']:
        print item



if __name__ == '__main__':
    # filename = 'data/f2c74a8ab2a40bdae1796ae48dc47e19a69a52b0'
    # parse(filename)
    
    from pysurvey import util
    util.setup_stop()
    
    debug()