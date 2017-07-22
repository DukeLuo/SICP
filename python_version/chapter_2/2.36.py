#! usr/bin/env python
# -*- coding: utf-8 -*-
# Exercise 2.36

from sicp import *

def accumulate_n(op,init,seqs):
    if init:
	    init = []
    if seqs[0]:
        return cons_of_list(accumulate(op,init,map(car,seqs)),\
                            accumulate_n(op,init,map(cdr,seqs)))
    else:
        return []

