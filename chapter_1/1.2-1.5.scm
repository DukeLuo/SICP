#lang scheme
;Exercise 1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))

;Exercise 1.3
(define (fun n1 n2 n3 )
  (if (> n1 n2)
      (+ (* n1 n1)
         (* (if (> n2 n3) n2 n3)
            (if (> n2 n3) n2 n3)))
      (+ (* n2  n2)
         (* (if (> n1 n3) n1 n3)
            (if (> n1 n3) n1 n3)))))
			
;Exercise 1.4 
;calculate the value of a + |b|

;Exercise1.5 
;the interpreter that uses applicative-order evaluation will get into a infinite loop
;while the one uses normal-order evaluation  will return the value 0
;applicatice-order evaluation means 'evaluate the arguments and apply',so when calculates the (p) will get into a infinite loop
;normal-order evaluation will return 0 while calculates the if expression after expending fully according to 'fully expend and then reduce'