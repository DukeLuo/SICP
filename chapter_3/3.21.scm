#lang scheme
;;; Exercise 3.21

(require rnrs/base-6)
(require rnrs/mutable-pairs-6)

;;; Representing Queues
(define (front-ptr queue) (car queue))
(define (rear-ptr queue) (cdr queue))
(define (set-front-ptr! queue item)
  (set-car! queue item))
(define (set-rear-ptr! queue item)
  (set-cdr! queue item))

;; constructor
(define (make-queue)
  (cons '() '()))


;; predicate
(define (empty-queue? queue)
  (null? (front-ptr queue)))


;; selector
(define (front-queue queue)
  (if (empty-queue? queue)
      (error "FRONT called with an empty queue" queue)
      (car (front-ptr queue))))


;; mutator
(define (insert-queue! queue item)
  (let ((new-pair (cons item '())))
    (cond ((empty-queue? queue)
           (set-front-ptr! queue new-pair)
           (set-rear-ptr! queue new-pair)
           queue)
          (else
           (set-cdr! (rear-ptr queue) new-pair)
           (set-rear-ptr! queue new-pair)
           queue))))

(define (delete-queue! queue)
  (cond ((empty-queue? queue)
         (error "DELETE! called with an empty queue" queue))
        (else
         (set-front-ptr! queue (cdr (front-ptr queue)))
         queue)))



;;; Exercise 3.21
;; printer
(define (print-queue queue)
  (front-ptr queue))

