#lang scheme
;;; Exercise 2.22

(define square (lambda (x) (* x x)))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items '()))

; > (square-list (list 1 2 3 4))
; (16 9 4 1)


(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items '()))

; > (square-list (list 1 2 3 4))
; ((((() . 1) . 4) . 9) . 16)
;;; the combined order is wrong


(require "2.18.scm")
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        (reverse answer)
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items '()))

; > (square-list (list 1 2 3 4))
; (1 4 9 16)

