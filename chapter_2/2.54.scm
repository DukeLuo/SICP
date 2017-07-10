#lang scheme
;;; Exercise 2.54

(define (equal? a b)
  (cond ((and (symbol? a)
              (symbol? b)) (eq? a b))
        ((and (null? a)
              (null? b)) true)
        ((or (null? a)
             (null? b)) false)
        ((and (list? a)
              (list? b)) (and (equal? (car a) (car b))
                              (equal? (cdr a) (cdr b))))
        (else false)))

