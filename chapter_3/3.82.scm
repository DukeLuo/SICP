;;; Exercise 3.82

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (/ (random (* range 1000))    ;;This makes random-in-range look like can generate float number
              1000.0))))

(define (random-in-range-stream low high)
  (cons-stream (random-in-range low high)
               (random-in-range-stream low high)))

(define (estimate-integral P x1 x2 y1 y2)
  (stream-map (lambda (x) (* x (* (- x2 x1) (- y2 y1))))
              (monte-carlo (stream-map (lambda (x y) (P x y))
                                       (random-in-range-stream x1 x2)
                                       (random-in-range-stream y1 y2))
                           0 
                           0)))

(define (circle-test radius)
  (lambda (x y)
    (<= (+ (square x) (square y))
        (square radius))))

(define pi-stream (estimate-integral (circle-test 1) -1 1 -1 1))

        