#lang scheme

(define (square x) (* x x))

(define (nontrivial-square-root? a n)
  (and (not (= a 1))
       (not (= a (- n 1)))
       (= 1 (remainder (square a) n))))

(define (non-zero-random n)
  (let ((r (random n)))
    (if (not (= r 0))
        r
        (non-zero-random n))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((nontrivial-square-root? base m) 0)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
                  m))
         (else
          (remainder
           (* base (expmod base (- exp 1) m))
           m))))

(define (miller-rabin-test n)
  (let ((times (ceiling (/ n 2)))) ;ceiling returns the smallest integer not smaller than x
        (test-iter n times)))

(define (test-iter n times)
  (cond ((= times 0) true)
        ((= (expmod (non-zero-random n) (- n 1) n) 1)
         (test-iter n (- times 1)))
        (else false)))

(miller-rabin-test 561)
(miller-rabin-test 1105)
(miller-rabin-test 1729)
(miller-rabin-test 2465)
(miller-rabin-test 2821)
(miller-rabin-test 6601)
(miller-rabin-test 2)
(miller-rabin-test 5)
(miller-rabin-test 8)
(miller-rabin-test 73)

; #f
; #f
; #f
; #f
; #f
; #f
; #t
; #t
; #f
; #t

;;; reference: http://sicp.readthedocs.io/en/latest/chp1/28.html