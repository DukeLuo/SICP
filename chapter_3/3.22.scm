#lang scheme
;;; Exercise 3.22

(require rnrs/base-6)
(require rnrs/mutable-pairs-6)

(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    (define (empty-queue?)
      (null? front-ptr))
    (define (front-queue)
      (if (empty-queue?)
          (error "FRONT called with an empty queue" null)
          front-ptr))
    (define (insert-queue! item)
      (let ((new-pair (cons item '())))
        (cond ((empty-queue?)
               (set! front-ptr new-pair)
               (set! rear-ptr new-pair))
              (else
           (set-cdr! rear-ptr new-pair)
           (set! rear-ptr new-pair)))))
    (define (delete-queue!)
      (cond ((empty-queue?)
             (error "DELETE! called with an empty queue" null))
            (else
             (set! front-ptr (cdr front-ptr)))))
    (define (print-queue)
      front-ptr)

    (define (dispatch m)
      (cond ((eq? m 'empty-queue?) (empty-queue?))
            ((eq? m 'front-queue) (front-queue))
            ((eq? m 'insert-queue!) insert-queue!)
            ((eq? m 'delete-queue!) (delete-queue!))
            ((eq? m 'print-queue) (print-queue))
            (else (error "Unknown operation: QUEUE" m))))
    dispatch))

