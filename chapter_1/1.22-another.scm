#lang scheme

(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))


;;; Exercise 1.22

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
         (let ((start-time (current-inexact-milliseconds)))
         (cond ((prime? start) (display start)
                               (report-prime (- (current-inexact-milliseconds) start-time))
                               (newline)
                               (search-for-primes (next-odd start) (- count 1)))
               (else (search-for-primes (next-odd start) count)))))))

 
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

; 10007 *** 0.0
; 10009 *** 0.0
; 10037 *** 0.0

; 100003 *** 0.0
; 100019 *** 0.0
; 100043 *** 0.0

; 1000003 *** 0.0
; 1000033 *** 0.0
; 1000037 *** 0.50146484375

; 10000000019 *** 8.021728515625
; 10000000033 *** 8.56494140625
; 10000000061 *** 8.060302734375

; 100000000003 *** 25.530029296875
; 100000000019 *** 25.066162109375
; 100000000057 *** 25.56884765625

; 1000000000039 *** 83.18212890625
; 1000000000061 *** 81.28759765625
; 1000000000063 *** 82.255859375
