#! usr/bin/env python
# -*- coding: utf-8 -*-
# Exercise 2.40-2.41
  
def permutations(s):
    if s:
        result = []
        for i in s:
            L = s[:]
            L.remove(i)
            rest = permutations(L)
            result += map(lambda x:[i] + x,rest)
        return result
    else:
        return [[]]
        
def unique_pairs(n):
    for i in range(1,n+1):
        for j in range(1,i):
            yield [i,j]
            
def sum_ordered_triples(n,s):
    for i in range(1,n+1):
        for pair in unique_pairs(i-1):
            pair.insert(0,i)
            sum = 0
            for e in pair:
                sum += e
            if sum == s:
                yield pair

