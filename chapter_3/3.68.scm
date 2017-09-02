;;; Exercise 3.68

(define (pairs s t)
  (interleave (stream-map (lambda (x) (list (stream-car s) x))
                          t)
              (pairs (stream-cdr s) (stream-cdr t))))
              
;;; When I evaluate (pairs integers integers) in MIT/GNU Scheme,
;;; I get an error "Aborting！: maximum recursion depth exceeded".
;;; In Louis' version, when calling the pairs, it will get a recursive call to itself, so it never returns value.
;;; The streams are built with a regular value and a promise, there is no a regular value, so Louis' method doesn't work.

