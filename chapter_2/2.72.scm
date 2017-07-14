#lang scheme
;;; Exercise 2.72

;;; to encode the most frequent symbol of the special case of 2.71, the order of growth is O(n-1) + O(1),which is O(n)
;;; because we just need do one search for the left branch and the right
;;; as for encoding the least frequent symbol, we need to search both left and right branches at every node
;;; the order of growth is (O(n-1) + O(1)) + (O(n-2) + O(1)) + ... + O(1), which is O(n^2)

