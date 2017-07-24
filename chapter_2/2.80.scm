#lang scheme
;;; Exercise 2.80

(define (install-scheme-number-package)
  ;; ...
  (put '=zero? '(scheme-number) zero?)
  'done)

(define (install-rational-package)
  ;; ...
  (define (=zero?-rat x)
    (zero? (numer x)))
  ;; ...
  (put '=zero? '(rational)
       (lambda (x) (=zero?-rat x)))
  'done)

(define (install-complex-package)
  ;; ...
  (define (=zero?-complex z)
    (zero? (magnitude z)))
  ;; ...
  (put '=zero? '(complex)
       (lambda (x) (=zero?-complex x)))
  'done)

(define (=zero? x) (apply-generic '=zero? x))

