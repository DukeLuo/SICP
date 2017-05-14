#lang scheme

;;; Exercise 1.24


;;; the probabilistic algorithm based on the Fermat test

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

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))



(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 1000)
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
         (cond ((fast-prime? start 1000) (timed-prime-test start)
                               (search-for-primes (next-odd start) (- count 1)))
               (else (search-for-primes (next-odd start) count))))))


(search-for-primes 1000 3)
(search-for-primes 10000 3)
(search-for-primes 100000 3)
(search-for-primes 1000000 3)
(search-for-primes 10000000 3)
(search-for-primes 100000000 3)
(search-for-primes 1000000000 3)

; 1009 *** 1.501708984375
; 1013 *** 1.50341796875
; 1019 *** 2.00537109375

; 10007 *** 2.04150390625
; 10009 *** 2.0048828125
; 10037 *** 2.00537109375

; 100003 *** 2.506591796875
; 100019 *** 2.50634765625
; 100043 *** 2.50537109375

; 1000003 *** 2.506103515625
; 1000033 *** 2.5458984375
; 1000037 *** 3.008056640625

; 10000019 *** 3.008056640625
; 10000079 *** 3.007568359375
; 10000103 *** 3.50927734375

; 100000007 *** 3.50927734375
; 100000037 *** 3.509033203125
; 100000039 *** 4.010498046875

; 1000000007 *** 4.0078125
; 1000000009 *** 4.010498046875
; 1000000021 *** 4.010498046875

;;; log(1000000)/log(1000)=2
;;; but actually it doesn't run like this,there are many factors can affect run time
;;; it just provide a crude description of the behavior of a process