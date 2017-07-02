#lang scheme
;;; Exercise 2.49

;;; a)
(define outline-of-frame (list (make-segment (make-vect 0 0) (make-vect 1 0))
                               (make-segment (make-vect 1 0) (make-vect 1 1))
                               (make-segment (make-vect 1 1) (make-vect 0 1))
                               (make-segment (make-vect 0 1) (make-vect 0 0))))
(define outline-painter (segments->painter outline-of-frame))

;;; b)
(define X (list (make-segment (make-vect 0 0) (make-vect 1 1))
                (make-segment (make-vect 0 1) (make-vect 1 0))))
(define X-painter (segment->painter X))

;;; c)
(define diamond-shape (list (make-segment (make-vect 0.5 0) (make-vect 1 0.5))
                            (make-segment (make-vect 1 0.5) (make-vect 0.5 1))
                            (make-segment (make-vect 0.5 1) (make-vect 0 0.5))
                            (make-segment (make-vect 0 0.5) (make-vect 0.5 0))))
(define diamond-painter (segment->painter diamond-shape))

;;; d)
(define wave (list (make-segment (make-vect 0 0) (make-vect 0.5 0.3))
                   (make-segment (make-vect 1 0) (make-vect 0.5 0.3))
                   (make-segment (make-vect 0.5 0.3) (make-vect 0.5 1))
                   (make-segment (make-vect 0.2 0.7) (make-vect 0.9 0.6))))
(define wave-painter (segment->painter wave))

                               