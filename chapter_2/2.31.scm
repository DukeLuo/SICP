#lang scheme
;;; Exercise 2.31

(define (tree-map proc items)
  (cond ((null? items) '())
        ((not (pair? items)) (proc items))
        (else (cons (tree-map proc (car items))
                    (tree-map proc (cdr items))))))

(define (tree-map proc items)
  (map (lambda (sub-items)
         (if (pair? sub-items)
             (tree-map proc sub-items)
             (proc sub-items)))
       items))

