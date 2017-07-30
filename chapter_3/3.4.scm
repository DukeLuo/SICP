#lang scheme
;;; Exercise 3.4

(define (make-account balance initial-password)
  (define bad-password-times 0)
  
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (call-the-cops) "Calling the cops") 
  (define (dispatch password m)
    (if (>= bad-password-times 7)
        (lambda (m) (call-the-cops))
        (if (eq? password initial-password)
            (begin (set! bad-password-times 0)
                   (cond ((eq? m 'withdraw) withdraw)
                         ((eq? m 'deposit) deposit)
                         (else (error "Unknow request: MAKE-ACCOUNT"
                               m))))
            (begin (set! bad-password-times (+ bad-password-times 1))
                   (lambda (m) "Incorrect password")))))
  dispatch)

