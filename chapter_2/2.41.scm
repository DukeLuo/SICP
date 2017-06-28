#lang scheme
;;; Exercise 2.41

(require "2.40.scm")
(require "2.33.scm")
(define (ordered-triples n)
  (flatmap (lambda (k)
             (map (lambda (pair) (cons k pair))
                  (unique-pairs (- k 1))))
             (enumerate-interval 1 n)))

(define (equal-sum-triples n s)
  (filter (lambda (triple) (= (+ (car triple)
                                 (cadr triple)
                                 (caddr triple))
                              s))
          (ordered-triples n)))

