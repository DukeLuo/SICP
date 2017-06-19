#lang scheme
;;; Exercise 2.36

(require "2.33.scm")
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(provide accumulate-n)

