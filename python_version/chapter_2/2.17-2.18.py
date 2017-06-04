#! usr/bin/env python
# -*- coding: utf-8 -*-
# Exercise 2.17-2.18


# last-pair
def last_pair(items):
	return items[-1]
	

	
# reverse
def reverse(items):
	return items[::-1]
	
# second method
# recursion
def reverse2(items):
	if items == []:
		return []
	else:
		return reverse2(items[1:]) + items[:1]
		
		