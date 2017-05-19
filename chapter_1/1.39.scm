#lang sicp

;;; Exercise 1.39
(define (cont-frac n d k)
  (define (next x) (+ x 1))

  (define (cf i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i)
           (+ (d i) (cf (next i))))))

  (cf 1))

(define (tan-cf x k)
  (define (n i)
    (if (= i 1)
        x
        (-(* x x))))

  (define (d i)
    (- (* 2 i) 1.0))

  (cont-frac n d k))


; > (tan 10)
; 0.6483608274590866
; > (tan-cf 10 10)
; 0.2202426219807905
; > (tan-cf 10 100)
; 0.6483608274590866
; > (tan 45)
; 1.6197751905438615
; > (tan-cf 45 100)
; 1.6197751905438595

