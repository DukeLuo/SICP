#! usr/bin/env python
# -*- coding: utf-8 -*-
# Exercise 2.34

from sicp import *

def horner_eval(x,coefficient_sequence):
    return accumulate(lambda this_coeff,higher_terms:this_coeff + x * higher_terms,\
                      0,coefficient_sequence)

