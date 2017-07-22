#! usr/bin/env python
# -*- coding: utf-8 -*-
# Exercise 2.33

from sicp import *

def map_py(p,sequence):
    return accumulate(lambda x,y:cons_of_list(p(x),y),[],sequence)

def append_py(seq1,seq2):
    return accumulate(cons_of_list,seq2,seq1)

def length_py(sequence):
    return accumulate(lambda x,y:y+1,0,sequence)

	