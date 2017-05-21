#lang sicp

;;; compose
(define (compose f g)
  (lambda (x) (f (g x))))


;;; repeated
(define (repeated f n)
  (define (iter i result)
    (if (= n i)
        result
        (iter (+ i 1)
              (compose result f))))
  (iter 1 f))



;;; Exercise 1.44
;;; smooth
(define dx 0.00001)

(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx))
                    (f x)
                    (f (+ x dx)))
                 3)))

;;; n-fold smoothed function
(define (n-fold-smooth f n)
  ((repeated smooth n) f))

  