#! usr/bin/env python
# -*- coding: utf-8 -*-
# Exercise 2.6

def zero(f):
	return (lambda x: x)	
	
def add_1(n):
	return (lambda f: (lambda x: f(n(f)(x))))
	
	
# one
def one(f):
	return (lambda x: f(x))
	
# two
def two(f):
	return (lambda x: f(f(x)))
		
# add
def add(m,n):
	return (lambda f: (lambda x: n(f)(m(f)(x))))


	
# --------------------------
# make an instance	

def inc(x):
	return x+1	
	
"""	
	Example:
	>>> zero(inc)(0)
	0
	>>> one(inc)(0)
	1
	>>> two(inc)(0)
	2
	>>> add_1(zero)(inc)(0)
	1
	>>> add_1(two)(inc)(0)
	3
	>>> add(zero,two)(inc)(0)
	2
	>>> add(two,two)(inc)(0)
	4
"""
