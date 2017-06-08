#! usr/bin/env python
# -*- coding: utf-8 -*-
# Exercise 2.20

def same_parity(*args):
	is_even = lambda x: x % 2 == 0
	is_odd = lambda x: x % 2 == 1
	if is_even(args[0]):
		return filter(is_even,args)
	else:
		return filter(is_odd,args)
		
	

	