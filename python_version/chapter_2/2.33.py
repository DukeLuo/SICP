#! usr/bin/env python
# -*- coding: utf-8 -*-
# Exercise 2.33

# Sequence Operations
def accumulate(op,initial,sequence):
	if sequence:
		return op(sequence[0],accumulate(op,initial,sequence[1:]))
	else:
		return initial
'''
def fib(n):
	"""
	recursion
	"""
	if n == 0 or n == 1:
		return n
	else:
		return fib(n-1) + fib(n-2)
'''
def fib(n):
	"""
	iteration
	"""
	def iter(a,b,counter):
		if counter == 0:
			return b
		else:
			return iter(a+b,a,counter-1)
	return iter(1,0,n)

def cons_of_list(x,y):
	if isinstance(x,int) and isinstance(y,int):
		return [x,y]
	elif isinstance(x,list) and isinstance(y,int):
		return x + [y]
	elif isinstance(x,int) and isinstance(y,list):
		return [x] + y
	else:
		return x + y
		
def even_fibs(n):
	return reduce(lambda x,y: cons_of_list(x,y),filter(lambda x: x % 2 == 0,map(fib,range(n+1))))

	
# Exercise 2.33
def py_map(p,sequence):
	return accumulate(lambda x,y:cons_of_list(p(x),y),[],sequence)
	
def py_append(seq1,seq2):
	return accumulate(lambda x,y:cons_of_list(x,y),seq2,seq1)

def py_length(sequence):
	return accumulate(lambda x,y:y+1,0,sequence)
	
	