#lang scheme
;;; Exercise 2.14

(require "2.7.scm")
(require "2.12.scm")

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
     one (add-interval (div-interval one r1)
                       (div-interval one r2)))))


(define interval1 (make-center-percent 1 0.5))
(define interval2 (make-center-percent 1 0.5))
(define interval3 (make-center-percent 2 0.4))

; > (par1 interval1 interval3)
; (0.6578294059077332 . 0.6756076330766655)
; > (par2 interval1 interval3)
; (0.6635554067626381 . 0.669777630268835)
;;; obviously,lem is right,the answers are different

; > (par1 interval1 interval2)
; (0.4925497512437812 . 0.5075502512562812)
; > (par2 interval1 interval2)
; (0.49750000000000005 . 0.5025)

