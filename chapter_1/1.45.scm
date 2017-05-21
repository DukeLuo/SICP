#lang sicp

;;; fixed-point
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  
  (try first-guess))


;;; average damping
(define (average x y) (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))


;;; general procedure
(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))


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



;;; Exercise 1.45

;;; 4th-root
(define (4th-root x)
  (fixed-point-of-transform (lambda (y) (/ x
                                           (* y y y)))
                            (repeated average-damp 2)
                            1.0))

; (4th-root 1)
; (4th-root 16)
; (4th-root 81)
; (4th-root 100)

; 1.0
; 2.0000000000021965
; 3.000000000000033
; 3.1622776601683795


;;; 5th-root
(define (5th-root x)
  (fixed-point-of-transform (lambda (y) (/ x
                                           (* y y y y)))
                            (repeated average-damp 2)
                            1.0))

; (5th-root 1)
; (5th-root 32)
; (5th-root 243)

; 1.0
; 2.0000015129957607
; 3.0000008877496294


;;; 6th-root
(define (6th-root x)
  (fixed-point-of-transform (lambda (y) (/ x
                                           (* y y y y y)))
                            (repeated average-damp 2)
                            1.0))

; (6th-root 1)
; (6th-root 64)
; (6th-root 729)

; 1.0
; 2.0000029334662086
; 2.999996785898161


;;; 7th-root
(define (7th-root x)
  (fixed-point-of-transform (lambda (y) (/ x
                                           (* y y y y y y)))
                            (repeated average-damp 2)
                            1.0))

; (7th-root 1)
; (7th-root 128)
; (7th-root 2187)

; 1.0
; 2.0000035538623377
; 3.0000041735235943


;;; 8th-roor
(define (8th-root x)
  (fixed-point-of-transform (lambda (y) (/ x
                                           (* y y y y y y y)))
                            (repeated average-damp 3)
                            1.0))

; (8th-root 1)
; (8th-root 256)
; (8th-root 6561)

; 1.0
; 2.0000000000039666
; 3.0000000000173292

;;; we can get the regular pattern
;;; the average damp needs to be applyied (log2 n) times for the nth root



;;; nth-root
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

(define (log2 n) (/ (log n) (log 2)))

(define (nth-root x n)
  (fixed-point-of-transform (lambda (y) (/ x
                                           (expt y (- n 1))))
                            (repeated average-damp (floor (log2 n))) ; floor returns the largest integer not larger than x
                            1.0))

(nth-root 1 4)
(nth-root 16 4)
(nth-root 81 4)
(nth-root 100 4)
(nth-root 1 7)
(nth-root 128 7)
(nth-root 2187 7)
(nth-root 1 8)
(nth-root 256 8)
(nth-root 6561 8)

; 1.0
; 2.0000000000021965
; 3.000000000000033
; 3.1622776601683795
; 1.0
; 2.0000035538623377
; 3.0000041735235943
; 1.0
; 2.0000000000039666
; 3.0000000000173292

