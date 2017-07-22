#! usr/bin/env python
# -*- coding: utf-8 -*-
# Exercise 2.37

from sicp import *

def dot_product(v,w):
    return accumulate(lambda x,y: x + y,0,map(lambda x,y: x * y,v,w))

def matrix_mul_vector(m,v):
    return map(lambda x: dot_product(x,v),m)

def transpose(mat):
    return accumulate_n(cons_of_list,[],mat)

def matrix_mul_matrix(m,n):
    cols = transpose(n)
    return map(lambda row:matrix_mul_vector(cols,row),m)

