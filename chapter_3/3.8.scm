#lang scheme
;;; Exercise 3.8

(define init 1)
(define f
  (lambda (x)
    (set! init (* x init))
    init))

; > (+ (f 0) (f 1))
; 0
; > (+ (f 1) (f 0))
; 0

