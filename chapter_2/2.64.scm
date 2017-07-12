#lang scheme
;;; Exercise 2.64

(require "2.63.scm")

(define (list->tree elements)
  (car (partial-tree elements (length elements))))
(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result
               (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result
                   (partial-tree
                    (cdr non-left-elts)
                    right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts
                     (cdr right-result)))
                (cons (make-tree this-entry
                                 left-tree
                                 right-tree)
                      remaining-elts))))))))

;;; a)
;;; partial-tree divides the elements into three parts,this-entry,left-size,right-size
;;; then gets the left-tree and right-tree by using recursion
;;; finally makes a balanced tree by make-tree
; > (list->tree (list 1 3 5 7 9 11))
; (5 (1 () (3 () ())) (9 (7 () ()) (11 () ())))
;          5
;      1       9
;        3    7  11

;;; b)
;;; list->tree visits each element once so so its growth is O(n)

(provide list->tree)

