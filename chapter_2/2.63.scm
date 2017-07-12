#lang scheme
;;; Exercise 2.63

;;; Sets as binary trees
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))


(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (entry set)) true)
        ((< x (entry set))
         (element-of-set? x (left-branch set)))
        ((> x (entry set))
         (element-of-set? x (right-branch set)))))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((< x (entry set))
         (make-tree (entry set)
                    (adjoin-set x (left-branch set))
                    (right-branch set)))
        ((> x (entry set))
         (make-tree (entry set)
                    (left-branch set)
                    (adjoin-set x (right-branch set))))))

;;; Exercise 2.63
(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list
                             (right-branch tree)
                             result-list)))))
  (copy-to-list tree '()))

(define set1 (list 7 (list 3 (list 1 '() '()) (list 5 '() '()))(list 9 '() (list 11 '() '()))))
(define set2 (list 3 (list 1 '() '())(list 7 (list 5 '() '()) (list 9 '() (list 11 '() '())))))
(define set3 (list 5 (list 3 (list 1 '() '()) '())(list 9 (list 7 '() '())(list 11 '() '()))))

;;; a)
; > (tree->list-1 set1)
; (1 3 5 7 9 11)
; > (tree->list-2 set1)
; (1 3 5 7 9 11)
; > (tree->list-1 set2)
; (1 3 5 7 9 11)
; > (tree->list-2 set2)
; (1 3 5 7 9 11)
; > (tree->list-1 set3)
; (1 3 5 7 9 11)
; > (tree->list-2 set3)
; (1 3 5 7 9 11)
;;; the two procedures produce the same result for every tree in Figure 2.16

;;; b)
;;; tree->list-1 visits each tree item once and at each visit it uses append so its growth is O(n . append) = O(n.log n)
;;; tree->list-2 visits each tree item once and at each visit it uses cons so its growth is O(1.n) = O(n)
;;; https://wizardbook.wordpress.com/2010/12/07/exercise-2-63/

(provide entry left-branch right-branch make-tree tree->list-2)

