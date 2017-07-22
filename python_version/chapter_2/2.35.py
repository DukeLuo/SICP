#! usr/bin/env python
# -*- coding: utf-8 -*-
# Exercise 2.35

from sicp import *

def is_list(item):
    return isinstance(item,list)

def count_leaves(t):
    return accumulate(lambda x,y: x + y,0,map(lambda subtree: count_leaves(subtree) if is_list(subtree) else 1,t))

