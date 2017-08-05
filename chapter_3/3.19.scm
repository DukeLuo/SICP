#lang scheme
;;; Exercise 3.19

(require rnrs/base-6)
(require rnrs/mutable-pairs-6)

(define (list-walk step list)
  (cond ((null? list) '())
        ((= step 0) list)
        (else (list-walk (- step 1)
                         (cdr list)))))

(define (has-cycle? x)
  (define (iter x1 x2)
    (let ((x1-walk (list-walk 1 x1))
          (x2-walk (list-walk 2 x2)))
      (cond ((or (null? x1-walk) (null? x2-walk)) false)
            ((eq? x1-walk x2-walk) true)
            (else (iter x1-walk x2-walk)))))
  (iter x x))

;;; Reference：http://sicp.readthedocs.io/en/latest/chp3/19.html

