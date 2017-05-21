#lang sicp


;;; Exercise 1.42
(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x) (* x x))

; > ((compose square inc) 6)
; 49

