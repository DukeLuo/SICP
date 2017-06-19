#lang scheme
;;; Exercise 2.35

(require "2.33.scm")
(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (subtree) (if (not (pair? subtree)) 1 (count-leaves subtree)))
                   t)))

