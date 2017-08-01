#lang scheme
;;; Exercise 3.6

(define rand
  (let ((x random-init))
    (lambda (action)
      (cond ((eq? action 'generate)
             (set! x (rand-update x))
             x)
            ((eq? action 'reset)
             (lambda (new-value)
               (set! x new-value)))
            (else (error "Unknown request -- RAND"
                         action))))))

