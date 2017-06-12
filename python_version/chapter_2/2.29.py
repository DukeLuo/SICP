#! usr/bin/env python
# -*- coding: utf-8 -*-
# Exercise 2.29

# a
def left_branch(mobile):
	return mobile[0]
	
def right_branch(mobile):
	return mobile[1]
	
def branch_length(branch):
	return branch[0]
	
def branch_structure(branch):
	return branch[1]
	
# b
def is_mobile(structure):
	return type(structure) == tuple

def is_weight(structure):
	return (type(structure) == (int or float) and not(is_mobile(structure)))
	
def branch_weight(branch):
	structure = branch_structure(branch)
	if is_weight(structure):
		return structure
	else:
		return total_weight(structure)
		
def total_weight(mobile):
	left = left_branch(mobile)
	right = right_branch(mobile)
	return branch_weight(left) + branch_weight(right)
	
# c
def branch_torque(branch):
	return branch_length(branch) * branch_weight(branch)
	
def is_balance_branch(branch):
	structure = branch_structure(branch)
	return (is_weight(structure) or is_balance_mobile(structure))
	
def is_balance_mobile(mobile):
	left = left_branch(mobile)
	right = right_branch(mobile)
	return (branch_torque(left) == branch_torque(right) and is_balance_branch(left) and is_balance_branch(right))

# d

	