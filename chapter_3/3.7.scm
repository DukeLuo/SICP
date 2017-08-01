#lang scheme
;;; Exercise 3.7

;;; The Costs of Introducing Assignment
(define (factorial n)
  (let ((product 1)
        (counter 1))
    (define (iter)
      (if (> counter n)
          product
          (begin (set! product (* product counter))
                 (set! counter (+ counter 1))
                 (iter))))
    (iter)))



;;; Exercise 3.7
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

(define (make-joint origin-account origin-password new-password)
  (lambda (password m)
    (if (eq? password new-password)
        (origin-account origin-password m)
        (lambda (m) "Incorrect password"))))

