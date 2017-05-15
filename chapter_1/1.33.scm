#lang sicp

;;; Exercise 1.33

(define (flitered-accumulate pred? combiner null-value term a next b)
   (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (if (pred? a) (combiner (term a)
                                               result)
                           result))))
  (iter a null-value))


;;; a)
(define (square x) (* x x))

(define (inc x) (+ x 1))


(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))


(define (sum-square-prime a b)
  (flitered-accumulate prime? + 0 square a inc b))



(sum-square-prime 2 4)
(sum-square-prime 1 10)

; 13
; 88


;;; b)
(define (identity x) x)

(define (GCD a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))


(define (product-less-coprime n)
  (define (pred? k)
    (and (< k n)
         (= (GCD k n) 1)))
  (flitered-accumulate pred? * 1 identity 1 inc n))


(product-less-coprime 10)
; 189