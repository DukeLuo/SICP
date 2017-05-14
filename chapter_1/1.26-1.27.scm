#lang sicp

;;; Exercise 1.26

;;; Louis's method generate a tree recursion rather than a liner recursion
;;; a tree recursion's execution time grows exponentially with the depth of the tree, which is the logarithm of N
;;; Therefore, the execution time is linear with N



;;; Exercise 1.27

(define (square x) (* x x)) 

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
                  m))
         (else
          (remainder
           (* base (expmod base (- exp 1) m))
           m))))

(define (fermat-test n a)
  (= (expmod a n n) a))

(define (fermat-test-iter n start)
  (cond ((= start n) true)
        ((fermat-test n start) (fermat-test-iter n (+ start 1)))
        (else false)))

(define (full-fermat-test n)
  (fermat-test-iter n 1))

(full-fermat-test 561)
(full-fermat-test 1105)
(full-fermat-test 1729)
(full-fermat-test 2465)
(full-fermat-test 2821)
(full-fermat-test 6601)

; #t
; #t
; #t
; #t
; #t
; #t

 