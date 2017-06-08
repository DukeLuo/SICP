#! usr/bin/env python
# -*- coding: utf-8 -*-
# Exercise 2.19

def cc(amount,coin_values):
	if amount == 0:
		return 1
	elif ((amount < 0) or coin_values == []):
		return 0
	else:
		return cc(amount,coin_values[1:]) + cc((amount-coin_values[0]),coin_values)