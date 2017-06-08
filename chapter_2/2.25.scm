#lang scheme
;;; Exercise 2.25

;;; Hierarchical Structures
(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

;;; Exercise 2.25
(car (cdr (car (cdr (cdr x)))))
(car (car x))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr x))))))))))))

