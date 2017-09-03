;;; Exercise 3.70

(define (merge-weight s1 s2 weight)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else 
          (let ((s1car (stream-car s1))
                (s2car (stream-car s2)))
            (cond ((< (weight s1car)
                      (weight s2car))
                   (cons-stream s1car
                                (merge-weight (stream-cdr s1) s2 weight)))
                  ((> (weight s1car)
                      (weight s2car))
                   (cons-stream s2car
                                (merge-weight s1 (stream-cdr s2) weight)))
                  (else (cons-stream s1car
                                     (merge-weight (stream-cdr s1)
                                                   s2
                                                   weight))))))))
                                                   
(define (weighted-pairs s t weight)
  (cons-stream (list (stream-car s) (stream-car t))
               (merge-weight (stream-map (lambda (x) (list (stream-car s) x))
                                         (stream-cdr t))
                             (weighted-pairs (stream-cdr s) (stream-cdr t) weight)
                             weight)))
                             
;;; a)
(define a-pairs (weighted-pairs integers
                                integers
                                (lambda (pair) (+ (car pair)
                                                  (cadr pair)))))

;;; b)
(define (divisible? x y) 
  (= (remainder x y) 0))
  
(define b-pairs (stream-filter (lambda (x) (or (divisible? (car x) 2)
                                               (divisible? (cadr x) 2)
                                               (divisible? (car x) 3)
                                               (divisible? (cadr x) 3)
                                               (divisible? (car x) 5)
                                               (divisible? (cadr x) 5)))
                               (weighted-pairs integers
                                               integers
                                               (lambda (pair) (+ (* 2 (car pair))
                                                                 (* 3 (cadr pair))
                                                                 (* 5 (car pair) (cadr pair)))))))

                                                  