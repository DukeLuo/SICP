#lang sicp

;;; continued fraction
(define (cont-frac n d k)
  (define (next x) (+ x 1))

  (define (cf i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i)
           (+ (d i) (cf (next i))))))

  (cf 1))



;;; Exercise 1.38
(define (n i) 1)

(define (d i)
  (if (= (remainder (+ i 1) 3) 0)
      (* (/ (+ i 1) 3) 2.0)
      1))

(define euler-e (+ 2 (cont-frac n d 100)))

; > euler-e
; 2.7182818284590455