#lang sicp


;;; Exercise 2.2
(define (make-point x y) (cons x y))

(define (x-point n) (car n))

(define (y-point n) (cdr n))


(define (make-segment start end) (cons start end))

(define (start-segment l) (car l))

(define (end-segment l) (cdr l))


(define (midpoint-segment l)
  (let ((start (start-segment l))
        (end (end-segment l)))
    (make-point (/ (+ (x-point start) (x-point end))
                   2.0)
                (/ (+ (y-point start) (y-point end))
                   2.0))))


(define (print-point p)
;  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

; (define a (make-point 2 2))
; (define b (make-point 4 5))
; (define l (make-segment a b))
; (define c (midpoint-segment l))

; > (print-point a)
; (2,2)
; > (print-point b)
; (4,5)
; > (print-point c)
; (3.0,3.5)
; > (print-point l)
; ((2 . 2),(4 . 5))



;;; Exercise 2.3
(define (perimeter-rectangle rectangle)
  (* 2 (+ (length-of-rectangle rectangle)
          (width-of-rectangle rectangle))))


(define (area-rectangle rectangle)
  (* (length-of-rectangle rectangle)
     (width-of-rectangle rectangle)))


;;; first way
;;; using two segments to represent a rectangle
(define (make-rectangle left-segment bottom-segment)
  (cons left-segment bottom-segment))


(define (width-of-rectangle rectangle)
  (let ((width-rectangle (car rectangle)))
    (abs (- (y-point (start-segment width-rectangle))
            (y-point (end-segment width-rectangle))))))


(define (length-of-rectangle rectangle)
  (let ((length-rectangle (cdr rectangle)))
    (abs (- (x-point (start-segment length-rectangle))
            (x-point (end-segment length-rectangle))))))

(define a (make-point 2 4))
(define b (make-point 2 2))
(define c (make-point 4 2))

(define ab (make-segment a b))
(define bc (make-segment b c))

(define rec1 (make-rectangle ab bc))
    
; > (perimeter-rectangle rec1)
; 8
; > (area-rectangle rec1)
; 4


;;; second way
;;; using two pairs of segments to represent a rectangle
(define (make-rectangle length-rectangle-1 length-rectangle-2 width-rectangle-1 width-rectangle-2)
  (cons (cons length-rectangle-1
              length-rectangle-2)
        (cons width-rectangle-1
              width-rectangle-2)))

(define (width-of-rectangle rectangle)
  (let ((width-rectangle (car (cdr rectangle))))
    (abs (- (y-point (start-segment width-rectangle))
            (y-point (end-segment width-rectangle))))))

(define (length-of-rectangle rectangle)
  (let ((length-rectangle (car (car rectangle))))
    (abs (- (x-point (start-segment length-rectangle))
            (x-point (end-segment length-rectangle))))))

(define a (make-point 2 4))
(define b (make-point 4 4))
(define c (make-point 2 2))
(define d (make-point 4 2))

(define ab (make-segment a b))
(define bd (make-segment b d))
(define dc (make-segment d c))
(define ca (make-segment c a))

(define rec2 (make-rectangle ab dc ca bd))

; > (perimeter-rectangle rec2)
; 8
; > (area-rectangle rec2)
; 4

  