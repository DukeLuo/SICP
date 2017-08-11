#lang scheme
;;; Exercise 3.30

(define (ripple-carry-adder list-A list-B list-S C)
  (define (iter A B c-in S c-out)
    (if (null? A)
        'ok
        (begin (full-adder (car A) (car B) c-in (car S) c-out)
               (iter (cdr A) (cdr B) c-out (cdr S) (make-wire)))))
  
  (define c-in (make-wire))
  (set-signal! c-in 0)
  (iter list-A list-B c-in list-S C))

