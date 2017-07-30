#lang scheme
;;; Exercise 3.1

;;; Local State Variables
(define (make-account balance) 
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknow request: MAKE-ACCOUNT"
                       m))))
  dispatch)



;;; Exercise 3.1
(define (make-accumulator sum)
  (lambda (input)
    (begin (set! sum (+ sum input))
                 sum)))

