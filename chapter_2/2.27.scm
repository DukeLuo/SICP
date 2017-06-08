#lang scheme
;;; Exercise 2.27

(define (deep-reverse items)
  (define (iter remainded-items result)
    (if (null? remainded-items)
        result
        (iter (cdr remainded-items)
              (let ((car-item (car remainded-items)))
                (if (pair? car-item)
                    (cons (deep-reverse car-item) result)
                    (cons car-item result))))))
  (iter items '()))

; > (define x (list (list 1 2) (list 3 4)))
; > x
; ((1 2) (3 4))
; > (reverse x)
; ((3 4) (1 2))
; > (deep-reverse x)
; ((4 3) (2 1))

