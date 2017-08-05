#lang scheme
;;; Exercise 3.18

(require rnrs/base-6)
(require rnrs/mutable-pairs-6)

(define (has-cycle? x)
  (let ((identity 'id))
    (cond ((null? x) false)
          ((eq? (car x) identity) true)
          (else (set-car! x identity)
                (has-cycle? (cdr x))))))

