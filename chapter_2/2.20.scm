#lang scheme
;;; Exercise 2.20

(require "2.18.scm")
(define (same-parity sample . others)
    (reverse (filter (if  (odd? sample)
                          odd?
                          even?)
                          (cons sample others)
                          '())))

(define odd? (lambda (x) (= (remainder x 2) 1)))

(define even? (lambda (x) (= (remainder x 2) 0)))

(define (filter f list result)
  (cond ((null? list) result)
        ((f (car list)) (filter f (cdr list) (cons (car list) result)))
        (else (filter f (cdr list) result))))


; > (same-parity 1 2 3 4 5 6 7)
; (1 3 5 7)
; > (same-parity 2 3 4 5 6 7)
; (2 4 6)

