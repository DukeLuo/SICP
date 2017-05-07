#lang scheme

;;; linear recursive
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

;;; linear iteration
(define (expt b n)
  (expt-iter b n 1))
(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (expt-iter b
                 (- counter 1)
                 (* b product))))

;;; using successive squaring
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))
(define (even? n)
  (= (remainder n 2) 0))
(define (square x) (* x x))


;;; Exercise 1.16

(define (expt b n)
  (fast-expt-iter b n 1))
(define (fast-expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter (square b) (/ n 2) a))
        (else (fast-expt-iter b (- n 1) (* a b)))))

; > (expt 2 10)
; 1024
; > (expt 2 0)
; 1
; > (expt 2 1)
; 2
; > (expt 3 3)
; 27


;;; Exercise 1.17

;;; analogous to the expt procedure
(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

(define (new-* a b)
  (cond ((= b 0) 0)
        ((even? b) (double (new-* a (halve b)))) ;(new-* (double a) (halve b))
        (else (+ a (new-* a (- b 1))))))
(define (double x) (+ x x))
(define (halve x) (/ x 2.0))

; > (new-* 2 0)
; 0
; > (new-* 2 1)
; 2
; > (new-* 2 8)
; 16
; > (new-* 4 6)
; 24
; > (new-* 10 100)
; 1000


;;; Exercise 1.18

(define (new-* a b)
  (new-*-iter a b 0))
(define (new-*-iter a b product)
  (cond ((= b 0) product)
        ((even? b) (new-*-iter (double a) (halve b) product))
        (else (+ a (new-*-iter a (- b 1) product)))))

; > (new-* 2 2)
; 4
; > (new-* 2 0)
; 0
; > (new-* 2 1)
; 2
; > (new-* 3 3)
; 9
; > (new-* 100 10)
; 1000


;;; Exercise 1.19

;;; (Tpq)^2: a <--- (bq + aq)q + (bq + aq + ap)(p + q) = b (2pq + q^2)+a(p^2 + q^2 + 2pq + q^2)
;;;          b <--- (bp + aq)p + (bq + a(p + q))q = b(p^2 + q^2) + a(2pq + q^2)
;;; p′ = p^2 + q^2     q′ = 2pq + q^2

(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))
                   (+ (* 2 p q) (square q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
						
;;; Reference: http://sicp.readthedocs.io/en/latest/chp1/19.html