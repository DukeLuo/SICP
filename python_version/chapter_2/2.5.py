#! usr/bin/env python
# -*- coding: utf-8 -*-
# Exercise 2.5

def cons(a,b):
	return ((2 ** a) * (3 ** b))
	
	
# recursion	
def car(z):
	if ((z % 2) == 0):
		return (car(z/2) + 1)
	else:
		return 0		

def cdr(z):
	if ((z % 3) == 0):
		return (cdr(z/3) + 1)
	else:
		return 0
				
		
# loop
def car(z):
	for b in range(z):
		for a in range(z):
			if (2 ** a == z / (3 ** b)):
				return a
			elif (2 ** a > z):
				break
	
def cdr(z):
	for a in range(z):
		for b in range(z):
			if (3 ** b == z / (2 ** a)):
				return b
			elif (3 ** b > z):
				break

				
# iteration
def car(z):

	def b_iter(n):	
	
		def a_iter(product,result):
			if (product == z / (3 ** n)):
				return result
			elif (product > z):
				return b_iter(n+1)
			else:
				return a_iter(2*product,result+1)			
		return a_iter(1,0)		
	return b_iter(0)
		
def cdr(z):

	def a_iter(n):	
	
		def b_iter(product,result):
			if (product == z / (2 ** n)):
				return result
			elif (product > z):
				return a_iter(n+1)
			else:
				return b_iter(3*product,result+1)			
		return b_iter(1,0)		
	return a_iter(0)
		
