#lang sicp

(require racket/trace)

;;; Exercise 1.37

;;; a)
;;; recursion
(define (cont-frac n d k)
  (define (next x) (+ x 1))

  (define (cf i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i)
           (+ (d i) (cf (next i))))))

  (cf 1))


(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)

; 0.6179775280898876
; 0.6180555555555556

; k = 11


;;; b)
;;; iteration
(define (cont-frac n d k)

  (define (next x) (- x 1))

  (define (iter i result)
    (if (= i 0)
        result
        (iter (next i)
              (/ (n i)
                 (+ (d i) result)))))

  (iter (- k 1) (/ (n k) (d k))))


(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)

; 0.6179775280898876
; 0.6180555555555556

;;; Reference: http://sicp.readthedocs.io/en/latest/chp1/37.html#id2

