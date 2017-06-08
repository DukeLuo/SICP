#lang scheme
;;; Exercise 2.20

;;; Mapping over lists
(define (map proc items)
  (if (null? items)
      '()
      (cons (proc (car items))
            (map proc (cdr items)))))


;;; Exercise 2.21
(define (square-list items)
  (if (null? items)
      '()
      (cons ((lambda (x) (* x x)) (car items))
            (square-list (cdr items)))))

(define (square-list items)
  (map (lambda (x) (* x x)) items))

