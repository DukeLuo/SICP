#lang scheme


;;; using procedures
(define (cons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (error "Arguement not 0 or 1: CONS" m))))
  dispatch)

;(define (cons x y)
;  (lambda (m) (cond ((= m 0) x)
;                    ((= m 1) y)
;                    (else (error "Arguement not 0 or 1: CONS" m)))))

;(define (car z) (z 0))

;(define (cdr z) (z 1))



;;; Exercise 2.4
(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))


; (car (cons x y))
; (car (lambda (m) (m x y)))
; ((lambda (m) (m x y)) (lambda (p q) p))
; ((lambda (p q) p) x y)
; x


(define (cdr z)
  (z (lambda (p q) q)))


; > (define z (cons 1 2))
; > (car z)
; 1
; > (cdr z)
; 2

