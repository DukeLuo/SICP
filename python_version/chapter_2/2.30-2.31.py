#! usr/bin/env python
# -*- coding: utf-8 -*-
# Exercise 2.30-2.31

# Exercise 2.30
def square_tree(tree):
	return map(lambda subtree: square_tree(subtree) if isinstance(subtree,list) else (subtree * subtree),tree)
	
def square_tree(tree):
	result = []
	for subtree in tree: 
		if not(isinstance(subtree,list)):
			result.append(subtree * subtree)
		else:
			result.append(square_tree(subtree))
	return result

	
# Exercise 2.31
def tree_map(proc,tree):
	return map(lambda subtree: tree_map(proc,subtree) if isinstance(subtree,list) else proc(subtree),tree)

def tree_map(proc,tree):
	result = []
	for subtree in tree: 
		if not(isinstance(subtree,list)):
			result.append(proc(subtree))
		else:
			result.append(square_tree(subtree))
	return result
	
