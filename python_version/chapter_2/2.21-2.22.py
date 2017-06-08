#! usr/bin/env python
# -*- coding: utf-8 -*-
# Exercise 2.21-2.22

#Exercise 2.21
def square_list(items):
	return map(lambda x: x * x,items)

# Exercise 2.22
def square_list(items):
	result = []
	for i in items:
		result.append(i*i)
	return result

	