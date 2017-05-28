#lang sicp


;;; Exercise 2.6

;;; church numerals
(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))


; (add-1 zero)
; (add-1 (lambda (f) (lambda (x) x)))
; (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))
; (lambda (f) (lambda (x) (f ((lambda (x) x) x))))
; (lambda (f) (lambda (x) (f  x)))


;;; one
(define one (lambda (f) (lambda (x) (f x))))

;;; two
(define two (lambda (f) (lambda (x) (f (f x)))))

;;; add
(define (add m n)
  (lambda (f) (lambda (x) ((n f) ((m f) x)))))


;;; this problem is very abstractive,we can make an instance to help us understand better
(define (inc x) (+ x 1))

; > ((one inc) 0)
; 1
; > ((two inc) 0)
; 2
; > (((add one two) inc) 0)
; 3

