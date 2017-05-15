#lang sicp

;;; Exercise 1.31
;;; a)
 (define (product term a next b)
   (if (> a b)
       1
       (* (term a)
          (product term (next a) next b))))


;;; factorial
(define (inc x) (+ x 1))

(define (identity x) x)

(define (factorial x)
  (product identity 1 inc x))

(factorial 0)
(factorial 4)
(factorial 5)

; 1
; 24
; 120


;;; compute π
(define (john-π n)
  (define (term k)
    (if (even? k) (/ (+ k 2)
                     (+ k 1))
        (/ (+ k 1)
           (+ k 2))))
  (* 4
     (product term 1.0 inc n)))

(define (even? x) (= (remainder x 2) 0))

(john-π 10)
(john-π 100)
(john-π 1000)
(john-π 10000)
(john-π 100000)

; 3.275101041334807
; 3.1570301764551645
; 3.143160705532257
; 3.1417497057379635
; 3.1416083612780903


;;; b)
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a)
                          result))))
  (iter a 1))