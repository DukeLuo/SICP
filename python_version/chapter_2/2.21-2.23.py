#! usr/bin/env python
# -*- coding: utf-8 -*-
# Exercise 2.21-2.23

#Exercise 2.21
def square_list(items):
	return map(lambda x: x * x,items)

# Exercise 2.22
def square_list(items):
	result = []
	for i in items:
		result.append(i*i)
	return result
	
# Exercise 2.23
def for_each(proc,items):
	if items == []:
		pass
	else:
		proc(items[0])
		return for_each(proc,items[1:])

'''
def printf(x):
	print x
	
>>> for_each(printf,[57,321,88])
57
321
88
'''

	