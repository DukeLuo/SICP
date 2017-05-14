#lang scheme

;;; Exercise 1.23

(define (next n)
  (if (= n 2) (+ n 1) (+ n 2)))

(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b) (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))



(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (current-inexact-milliseconds) start-time))
      false))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))


(define (next-odd n)
  (if (= (remainder n 2) 0)
      (+ n 1)
      (+ n 2)))
  
(define (search-for-primes start count)
  (cond ((= count 0) (newline))
        (else
         (cond ((prime? start) (timed-prime-test start)
                               (search-for-primes (next-odd start) (- count 1)))
               (else (search-for-primes (next-odd start) count))))))

(search-for-primes 1000 3)
(search-for-primes 10000 3)
(search-for-primes 100000 3)
(search-for-primes 1000000 3)
(search-for-primes 10000000000 3)
(search-for-primes 100000000000 3)
(search-for-primes 1000000000000 3)

; 1009 *** 0.0
; 1013 *** 0.0
; 1019 *** 0.0
; 
; 10007 *** 0.0
; 10009 *** 0.0
; 10037 *** 0.0
; 
; 100003 *** 0.0
; 100019 *** 0.0
; 100043 *** 0.0
; 
; 1000003 *** 0.0
; 1000033 *** 0.0
; 1000037 *** 0.0
; 
; 10000000019 *** 5.5146484375
; 10000000033 *** 8.021240234375
; 10000000061 *** 5.012451171875
; 
; 100000000003 *** 25.2646484375
; 100000000019 *** 17.04443359375
; 100000000057 *** 18.076171875
; 
; 1000000000039 *** 58.155029296875
; 1000000000061 *** 63.16796875
; 1000000000063 *** 55.646728515625

;;; No,not exactly half the time.