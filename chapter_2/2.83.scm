#lang scheme
;;; Exercise 2.83

(define (raise-int x)
  (make-rational (contents x) 1))
(put 'raise 'integer (lambda (x) (raise-int x)))

(define (raise-rat x)
  (make-real (/ (numer (contents x)) (denom (contents x)))))
(put 'raise 'rational (lambda (x) (raise-rat x)))

(define (raise-real x)
  (make-complex-from-real-imag (contents x) 0))
(put 'raise 'real (lambda (x) (raise-real x)))

(define (raise x)
  (apply-generic 'raise x))

