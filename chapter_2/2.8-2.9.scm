#lang scheme
;;; Exercise 2.8
;;; Exercise 2.9

(require "2.7.scm")
;;; Exercise 2.8
(define (sub-interval x y)
  (add-interval
   x
   (make-interval (- (upper-bound y))
                  (- (lower-bound y)))))


;;; Exercise 2.9
(define (width-interval x)
  (/ (- (upper-bound x) (lower-bound x))
     2.0))


(define interval1 (make-interval 1 2))
(define interval2 (make-interval 3 4))

; > (width-interval interval1)
; 0.5
; > (width-interval interval2)
; 0.5
; > (width-interval (add-interval interval1 interval2))
; 1.0
; > (width-interval (sub-interval interval1 interval2))
; 1.0
; > (width-interval (mul-interval interval1 interval2))
; 2.5
; > (width-interval (div-interval interval1 interval2))
; 0.20833333333333331

