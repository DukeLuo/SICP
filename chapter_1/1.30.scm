#lang sicp

;;; Exercise 1.30

;;; recursion
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))


;;; iteration
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result
                          (term a)))))
  (iter a 0))

