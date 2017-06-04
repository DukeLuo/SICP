#lang scheme
;;; Exercise 2.11

(require "2.7.scm")
(define (negative-interval? x) (< (upper-bound x) 0))

(define (positive-interval? x) (> (lower-bound x) 0))

(define (spans-zero? x) (and (<= (lower-bound x) 0)
                             (>= (upper-bound x) 0)))

(define (mul-interval x y)
  (let ((lx (lower-bound x))
        (ux (upper-bound x))
        (ly (lower-bound y))
        (uy (upper-bound y)))
    (cond ((and (positive-interval? x)
                (positive-interval? y)) (make-interval (* lx ly) (* ux uy)))
          ((and (positive-interval? x)
                (spans-zero? y)) (make-interval (* ux ly) (* ux uy)))
          ((and (positive-interval? x)
                (negative-interval? y)) (make-interval (* ux ly) (* lx uy)))
          ((and (spans-zero? x)
                (positive-interval? y)) (make-interval (* lx uy) (* ux uy)))
          ((and (spans-zero? x)
                (spans-zero? y)) (make-interval (min (* lx uy) (* ux ly))
                                                (max (* lx ly) (* ux uy))))
          ((and (spans-zero? x)
                (negative-interval? y)) (make-interval (* ux ly) (* lx ly)))
          ((and (negative-interval? x)
                (positive-interval? y)) (make-interval (* lx uy) (* ux ly)))
          ((and (negative-interval? x)
                (spans-zero? y)) (make-interval (* lx uy) (* lx ly)))
          ((and (negative-interval? x)
                (negative-interval? y)) (make-interval (* ux uy) (* lx ly))))))



(define interval1 (make-interval 1 2))
(define interval2 (make-interval -2 1))
(define interval3 (make-interval -4 -2))

; > interval1
; (mcons 1 2)
; > (negative-interval? interval1)
; #f
; > (positive-interval? interval1)
; #t
; > (spans-zero? interval1)
; #f
; > interval2
; (mcons -2 1)
; > (negative-interval? interval2)
; #f
; > (positive-interval? interval2)
; #f
; > (spans-zero? interval2)
; #t
; > interval3
; (mcons -4 -2)
; > (negative-interval? interval3)
; #t
; > (positive-interval? interval3)
; #f
; > (spans-zero? interval3)
; #f
; > interval1
; (mcons 1 2)
; > interval2
; (mcons -2 1)
; > interval3
; (mcons -4 -2)
; > (mul-interval interval1 interval1)
; (mcons 1 4)
; > (mul-interval interval2 interval2)
; (mcons -2 4)
; > (mul-interval interval3 interval3)
; (mcons 4 16)
; > (mul-interval interval1 interval2)
; (mcons -4 2)
; > (mul-interval interval1 interval3)
; (mcons -8 -2)
; > (mul-interval interval2 interval1)
; (mcons -4 2)
; > (mul-interval interval2 interval3)
; (mcons -4 8)
; > (mul-interval interval3 interval1)
; (mcons -8 -2)
; > (mul-interval interval3 interval2)
; (mcons -4 8)

