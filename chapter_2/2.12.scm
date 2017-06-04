#lang scheme
;;; Exercise 2.12

(require "2.7.scm")
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))


(define (make-center-percent c t)
  (make-center-width c (* c (/ t 100.0))))

(define (percent i)
  (* (/ (width i) (center i))
     100))

(provide make-center-percent percent)
  
  