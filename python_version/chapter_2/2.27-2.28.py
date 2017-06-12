#! usr/bin/env python
# -*- coding: utf-8 -*-
# Exercise 2.27-2.28

# Exercise 2.27
def reverse(items):
	return items[::-1]
	
def deep_reverse(items):
	result = []
	for sublist in items:
		if isinstance(sublist,list):
			result.append(deep_reverse(sublist))
		else:
			result.append(sublist)
	return reverse(result)

# Exercise 2.28
def fringe(tree):
	"""
	>>> x = [[1,2],[3,4]]
	>>> fringe(x)
	[1, 2, 3, 4]
	>>> fringe([x,x])
	[1, 2, 3, 4, 1, 2, 3, 4]
	"""
	result = []
	for subtree in tree:
		if isinstance(subtree,list):
			result.extend(fringe(subtree))
		else:
			result.append(subtree)
	return result
			
			