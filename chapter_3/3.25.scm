#lang scheme
;;; Exercise 3.25

(require rnrs/base-6)
(require rnrs/mutable-pairs-6)

(define (assoc key records)
  (cond ((null? records) false)
        ((equal? key (caar records)) (car records))
        (else (assoc key (cdr records)))))

(define (make-table)
  (let ((local-table (list '*table*)))
    (define (lookup keys)
      (if (null? (cdr keys))
          (let ((record (assoc keys (cdr local-table)))) ;;base case
            (if record
                (cdr record)
                false))
          (let ((subtable (assoc (car keys) (cdr local-table))))
            (if subtable
                (begin (set-cdr! local-table (cdr local-table))
                       (lookup (cdr keys)))
                false))))

    (define (insert! keys value)
      (if (null? (cdr keys))
          (let ((record (assoc keys (cdr local-table)))) ;;base case
            (if record
                (set-cdr! record value)
                (set-cdr! local-table
                          (cons (cons keys value)
                                (cdr local-table)))))
          (let ((subtable (assoc (car keys) (cdr local-table))))
            (if subtable
                (begin (set-cdr! local-table (cdr local-table))
                       (insert! (cdr keys) value))
                (set-cdr! local-table
                          (cons (list (car keys)
                                      (insert! (cdr keys) value))
                                (cdr local-table)))))))
    
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation: TABLE" m))))
    dispatch))

