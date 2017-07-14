#lang scheme
;;; Exercise 2.70

(require "2.68.scm")
(require "2.69.scm")

(define lyrics-pairs
  '((a 2) (Get 2) (Sha 3) (Wah 1)
   (boom 1) (job 2) (na 16) (yip 9)))

(define lyrics
  '((Get a job)
   (Sha na na na na na na na na)
   (Get a job)
   (Sha na na na na na na na na)
   (Wah yip yip yip yip yip yip yip yip yip)
   (Sha boom)))

(define (encode-lyrics lyrics huffman-tree)
  (map (lambda (message) (encode message huffman-tree))
       lyrics))

; > (define huffman-tree (generate-huffman-tree lyrics-pairs))
; > huffman-tree
; ((leaf na 16)
;  ((leaf yip 9)
;   (((leaf a 2) ((leaf boom 1) (leaf Wah 1) (boom Wah) 2) (a boom Wah) 4)
;    ((leaf Sha 3) ((leaf job 2) (leaf Get 2) (job Get) 4) (Sha job Get) 7)
;    (a boom Wah Sha job Get)
;    11)
;   (yip a boom Wah Sha job Get)
;   20)
;  (na yip a boom Wah Sha job Get)
;  36)
; > (encode-lyrics lyrics huffman-tree)
; ((1 1 1 1 1 1 1 0 0 1 1 1 1 0)
;  (1 1 1 0 0 0 0 0 0 0 0 0)
;  (1 1 1 1 1 1 1 0 0 1 1 1 1 0)
;  (1 1 1 0 0 0 0 0 0 0 0 0)
;  (1 1 0 1 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0)
;  (1 1 1 0 1 1 0 1 0))
;;; we need 84 bits for the encoding above
;;; if we used a fixed-length,we need 108 bits

