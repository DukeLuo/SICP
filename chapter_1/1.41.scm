#lang sicp


;;; Exercise 1.41
(define (double f)
  (lambda (x) (f (f x))))

; > ((double inc) 1)
; 3
; > ((double inc) 45)
; 47
; > (((double (double double)) inc) 5)
; 21

