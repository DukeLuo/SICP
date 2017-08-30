;;; Exercise 3.63

;;; Formulating iterations as stream processes
(define average (lambda (x y) (/ (+ x y)
                                 2.0)))

(define (sqrt-improve guess x)
  (average guess (/ x guess)))

(define (sqrt-stream x)
  (define guesses
    (cons-stream 1.0 
                 (stream-map (lambda (guess) (sqrt-improve guess x))
                             guesses)))
  guesses)


(define (pi-summands n)
  (cons-stream (/ 1.0 n)
               (stream-map - (pi-summands (+ n 2)))))

(define pi-stream
  (scale-stream (partial-sums (pi-summands 1)) 4))

(define (euler-transform s)
  (let ((s0 (stream-ref s 0))
        (s1 (stream-ref s 1))
        (s2 (stream-ref s 2)))
    (cons-stream (- s2 (/ (square (- s2 s1))
                          (+ s0 (* -2 s1) s2)))
                 (euler-transform (stream-cdr s)))))

(define (make-tableau transform s)
  (cons-stream s (make-tableau transform (transform s))))

(define (accelerated-sequence transform s)
  (stream-map stream-car (make-tableau transform s)))

 
 
;;; Exercise 3.63
;;; reference: http://community.schemewiki.org/?sicp-ex-3.63
;;;            https://wizardbook.wordpress.com/2010/12/20/exercise-3-63/
;;; As far as I'm concerned, there is a recursive call in Louis' method, 
;;; it will create an new environment, so the memorization method is useless.
;;; In the original version, because of memorization method, we can have a good efficiency. 

    