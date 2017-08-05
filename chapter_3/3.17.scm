#lang scheme
;;; Exercise 3.17

(require rnrs/base-6)
(require rnrs/mutable-pairs-6)

(define (memq x list)
  (cond ((null? list) false)
        ((eq? x (car list)) list)
        (else (memq x (cdr list)))))

(define traversed (list))
(define (traversed? x)
    (and (pair? x) (memq x traversed)))
(define (count-pairs x)
  (cond ((not (pair? x)) 0)
        ((traversed? x) 0)
        (else (set! traversed (cons x traversed))
              (+ (count-pairs (car x))
                 (count-pairs (cdr x))
                 1))))

