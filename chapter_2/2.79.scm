#lang scheme
;;; Exercise 2.79

(require "2.78.scm")

(define (install-scheme-number-package)
  ;; ...
  (put 'equ? '(scheme-number scheme-number) =)
  'done)

(define (install-rational-package)
  ;; ...
  (define (equ?-rat x y)
    (= (* (numer x) (denom y))
       (* (denom x) (numer y))))
  ;; ...
  (put 'equ? '(rational rational)
       (lambda (x y) (equ?-rat x y)))
  'done)

(define (install-complex-package)
  ;; ...
  (define (equ?-complex z1 z2)
    (and (= (real-part z1) (real-part z2))
         (= (imag-part z2) (imag-part z2))))
  ;; ...
  (put 'equ? '(complex complex)
       (lambda (x y) (equ?-complex x y)))
  'done)

(define (equ? x y) (apply-generic 'equ? x y))
        

;; another
(define (equ? n1 n2)
  (let ((tag1 (type-tag n1))
        (tag2 (type-tag n2)))
    (if (and (eq? tag1 'scheme-number)
             (eq? tag2 'scheme-number))
        (= n1 n2)
        (equ? (contents n1)
              (contents n2)))))

