#lang scheme
;;; Exercise 2.29

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;;; a
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

;;; b
(define (mobile? s) (pair? s))
(define (weight? s)
  (and (not (mobile? s))
       (number? s)))

(define (branch-weight branch)
  (let ((structure (branch-structure branch)))
    (if (weight? structure)
        structure
        (total-weight branch))))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

;;; c
(define (branch-torque branch)
  (* (branch-weight branch)
     (branch-length branch)))

(define (same-torque? left right)
  (= (branch-torque left)
     (branch-torque right)))

(define (branch-balance? branch)
  (let ((structure (branch-structure branch)))
    (or (weight? structure)
        (mobile-balance? structure))))
  
(define (mobile-balance? mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (and (same-torque? left right)
         (branch-balance? left)
         (branch-balance? right))))

;;; d
(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define (right-branch mobile)
  (cdr mobile))

(define (branch-structure branch)
  (cdr branch))
  
