#! usr/bin/env python
# -*- coding: utf-8 -*-

# cons
def cons(x,y):
	return (x,y)
	
# car
def car(z):
	return z[0]
	
# cdr
def cdr(z):
	return z[1]
	
	
### another method without using any data stracture
# cons
def cons(x,y):

	def dispatch(m):
		if m == 0:
			return x
		elif m == 1:
			return y
		else:
			raise TypeError("Argument not 0 or 1: %s" % m)
			
	return dispatch
	
# car
def car(z):
	return z(0)
	
#cdr
def cdr(z):
	return z(1)
	
	

### Exercise 2.4
def cons(x,y):
	return (lambda m: m(x,y))
	
def car(z):
	return z(lambda p,q: p)
	
def cdr(z):
	return z(lambda p,q: q)
	
	
	