#! usr/bin/env python
# -*- coding: utf-8 -*-
# Exercise 2.38

def fold_left(op,init,seqs):
    def fold_left_iter(result,rest):
        if rest:
            return fold_left_iter(op(result,car(rest)),cdr(rest))
        else:
            return result
    return fold_left_iter(init,seqs)
