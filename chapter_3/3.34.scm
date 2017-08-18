#lang scheme
;;; Exercise 3.34

;;; In Louis' method, when a value is set for a, we can get the right result,
;;; but when we set a value for b, we can't get the right value of a.
;;; Because Louis' method is based on the constraint multiplier, and multiplier is designed 
;;; such that 2 of the 3 values m1, m2 and product are expected in order to work correctly.
;;; We only have a value b, we have no enough information to get the right result.

