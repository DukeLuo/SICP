#lang scheme
;;; Exercise 2.65

(require "2.61.scm")
(require "2.62.scm")
(require "2.63.scm")
(require "2.64.scm")

(define (union-set-tree set1 set2)
  (list->tree (union-set (tree->list-2 set1)
                         (tree->list-2 set2))))

(define (intersection-set-tree set1 set2)
  (list->tree (intersection-set (tree->list-2 set1)
                                (tree->list-2 set2))))

