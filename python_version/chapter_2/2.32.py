#! usr/bin/env python
# -*- coding: utf-8 -*-
# Exercise 2.32
		
def append_py(item1,item2):
	item1.extend(item2)
	return item1
		
def subsets(s):
	if s:
		head = s[0]
		tail = s[1:]
		rest = subsets(tail)
		return append_py(rest,map(lambda x: append_py([head], x),rest))
	else:
		return [[]]
	