#lang scheme
;;; Exercise 3.5

;;; The Benefits of Introducing Assignment
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;; using rand
(define (estimate-pi trials)
  (sqrt (/ 6 (monte-carlo trials cesaro-test))))
(define (cesaro-test)
  (= (gcd (random 10000) (random 10000)) 1))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1)
                 (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1)
                 trials-passed))))
  (iter trials 0))


;; using rand-update
;(define (estimate-pi-2 trials)
;  (sqrt (/ 6 (random-gcd-test trials random-init))))
;(define (random-gcd-test trials initial-x)
;  (define (iter trials-remaining trials-passed x)
;    (let ((x1 (rand-update x)))
;      (let ((x2 (rand-update x1)))
;        (cond ((= trials-remaining 0)
;               (/ trials-passed trials))
;              ((= (gcd x1 x2) 1)
;               (iter (- trials-remaining 1)
;                     (+ trials-passed 1)
;                     x2))
;              (else
;               (iter (- trials-remaining 1)
;                     trials-passed
;                     x2))))))
;  (iter trials 0 initial-x))



;;; Exercise 3.5
(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (/ (random (* range 1000))    ;;This makes random-in-range look like can generate float number
              1000))))

(define (estimate-integral trials P x1 x2 y1 y2)
  (exact->inexact (* (* (- x2 x1) (- y2 y1))
                     (monte-carlo trials
                                  (lambda () (P (random-in-range x1 x2)
                                                (random-in-range y1 y2)))))))

(define square (lambda (x) (* x x)))
(define (circle-test radius)
  (lambda (x y)
    (<= (+ (square x) (square y))
        (square radius))))

