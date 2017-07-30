#lang scheme
;;; Exercise 3.3

(define (make-account balance initial-password) 
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch password m)
    (if (eq? password initial-password)
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknow request: MAKE-ACCOUNT"
                           m)))
        (lambda (m) "Incorrect password")))
  dispatch)

