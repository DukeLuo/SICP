#lang scheme
;;; Exercise 3.26

(require rnrs/base-6)
(require rnrs/mutable-pairs-6)

;; tree
(define (make-record-tree key value left right)
  (list key value left right))
(define (key tree) (car tree))
(define (value tree) (cadr tree))
(define (left-branch tree) (caddr tree))
(define (right-branch tree) (cadddr tree))

(define (tree-lookup k tree)
  (cond ((null? tree) false)
        ((= k (key tree))
         tree)
        ((< k (key tree))
         (tree-lookup k (left-branch tree)))
        ((> k (key tree))
         (tree-lookup k (right-branch tree)))))

(define (tree-insert! k v tree)
  (cond ((null? tree) (make-record-tree k v '() '()))
        ((= k (key tree))
         (make-record-tree k
                           v
                           (left-branch tree)
                           (right-branch tree)))
        ((< k (key tree))
         (make-record-tree (key tree)
                           (value tree)
                           (tree-insert! k v (left-branch tree))
                           (right-branch tree)))
        ((> k (key tree))
         (make-record-tree (key tree)
                           (value tree)
                           (left-branch tree)
                           (tree-insert! k v (right-branch tree))))))


;; table
(define (make-table)
  (let ((local-table '()))
    (define (lookup key)
      (let ((record (tree-lookup key local-table)))
        (if record
            (value record)
            false)))

    (define (insert! key value)
      (set! local-table (tree-insert! key value local-table))
      'ok)

    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch))

