#lang sicp

;;; Exercise 1.32
;;; a)
 (define (accumulate combiner null-value term a next b)
   (if (> a b)
       null-value
       (combiner (term a)
                 (accumulate combiner null-value term (next a) next b))))

(define (sum-acc term a next b)
  (accumulate + 0 term a next b))

(define (product-acc term a next b)
  (accumulate * 1 term a next b))


;;; b)
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a)
                                   result))))
  (iter a null-value))
  
