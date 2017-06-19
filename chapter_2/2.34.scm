#lang scheme
;;; Exercise 2.34

(require "2.33.scm")
(define (horner-eval x cofficient-sequence)
  (accumulate (lambda (this-coeff higher-items) (+ (* x higher-items) this-coeff))
              0
              cofficient-sequence))