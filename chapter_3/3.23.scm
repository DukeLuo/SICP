#lang scheme
;;; Exercise 3.23

(require rnrs/base-6)
(require rnrs/mutable-pairs-6)


;;; Doubly Linked list
;; constructor
(define (make-DLnode data)
  (let ((next '())
        (prev '()))
    (cons next (cons prev data))))

;; selector
(define (next node)
  (car node))
(define (prev node)
  (cadr node))
(define (data node)
  (cddr node))

;; mutator
(define (set-next! n1 n2)
  (set-car! n1 n2))
(define (set-prev! n1 n2)
  (set-car! (cdr n1) n2))



;;; Deque
(define (front-ptr deque) (car deque))
(define (rear-ptr deque) (cdr deque))
(define (set-front-ptr! deque item)
  (set-car! deque item))
(define (set-rear-ptr! deque item)
  (set-cdr! deque item))


;; constructor
(define (make-deque)
  (cons '() '()))


;; predicate
(define (empty-deque? deque)
  (or (eq? (rear-ptr deque) '())
      (eq? (front-ptr deque) '())))


;; selector
(define (front-deque deque)
  (if (empty-deque? deque)
      (error "FRONT called with an empty deque" deque)
      (data (front-ptr deque))))

(define (rear-deque deque)
  (if (empty-deque? deque)
      (error "REAR called with an empty deque" deque)
      (data (rear-ptr deque))))


;; mutator
(define (front-insert-deque! deque item)
  (let ((new-node (make-DLnode item)))
    (if (empty-deque? deque)
        (begin (set-front-ptr! deque new-node)
               (set-rear-ptr! deque new-node))
        (begin (set-next! new-node (front-ptr deque))
               (set-prev! (front-ptr deque) new-node)
               (set-front-ptr! deque new-node)))))

(define (rear-insert-deque! deque item)
  (let ((new-node (make-DLnode item)))
    (if (empty-deque? deque)
        (begin (set-front-ptr! deque new-node)
               (set-rear-ptr! deque new-node))
        (begin (set-next! (rear-ptr deque) new-node)
               (set-prev! new-node (rear-ptr deque))
               (set-rear-ptr! deque new-node)))))

(define (front-delete-deque! deque)
  (if (empty-deque? deque)
      (error "DELETE! called with an empty deque" deque)
      (let ((second-ptr (next (front-ptr deque))))
        (if (null? second-ptr)
            (begin (set-front-ptr! deque '())
                   (set-rear-ptr! deque '()))
            (begin (set-prev! second-ptr '())
                   (set-front-ptr! deque second-ptr))))))

(define (rear-delete-deque! deque)
  (if (empty-deque? deque)
      (error "DELETE! called with an empty deque" deque)
      (let ((next-to-last-ptr (prev (rear-ptr deque))))
        (if (null? next-to-last-ptr)
            (begin (set-front-ptr! deque '())
                   (set-rear-ptr! deque '()))
            (begin (set-next! next-to-last-ptr '())
                   (set-rear-ptr! deque next-to-last-ptr))))))


;;printer
(define (print-deque deque)
  (define (iter l)
    (if (null? l)
      '()
      (cons (data l) (iter (next l)))))
  (iter (front-ptr deque)))

