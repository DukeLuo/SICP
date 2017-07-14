#lang scheme
;;; Exercise 2.69

(require "2.67.scm")

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge ordered-leaf-set)
  (if (= (length ordered-leaf-set) 1)
      (car ordered-leaf-set)
      (successive-merge (adjoin-set (make-code-tree (car ordered-leaf-set)
                                                    (cadr ordered-leaf-set))
                                    (cddr ordered-leaf-set)))))

(provide generate-huffman-tree)

      