#lang sicp
;;; Exercise 2.13

(define interval1 (make-center-percent 1 0.2))
(define interval2 (make-center-percent 2 0.3))
(define interval3 (mul-interval interval1 interval2))

; > interval1
; (mcons 0.998 1.002)
; > interval2
; (mcons 1.994 2.006)
; > interval3
; (mcons 1.990012 2.0100119999999997)
; > (percent interval3)
; 0.49999700001799485

;;; a = Ca ± δa; b = Cb ± δb
;;; under the assumption of small percentage tolerances,
;;; we can get the simple formula Tab = δb/Cb + δa/Ca

;;; Reference: https://wizardbook.wordpress.com/2010/12/02/exercise-2-13/

