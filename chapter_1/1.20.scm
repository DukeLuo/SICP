#lang sicp

;;; Euclid's Algorithm
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
	  
;;; Exercise 1.20

; normal-order application
(gcd 206 40)
(= 40 0)?
(gcd 40 (remainder 206 40))

(= (remainder 206 40) 0)?
(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))

(= (remainder 40 (remainder 206 40)) 0)?
(= (remainder 40 6))?
(= 4 0)?
(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))

(= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)?
(= (remainder (remainder 206 40) (remainder 40 6)) 0)?
(= (remainder (remainder 206 40) 4) 0)?
(= (remainder 6 4) 0)?
(= 2 0)?
(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) remainder ((remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

(= remainder ((remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)?
(= remainder ((remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 6))) 0)?
(= remainder ((remainder 40 (remainder 206 40)) (remainder (remainder 206 40) 4)) 0)?
(= remainder ((remainder 40 (remainder 206 40)) (remainder 6 4)) 0)?
(= remainder ((remainder 40 (remainder 206 40)) 2) 0)?
(= remainder ((remainder 40 6) 2) 0)?
(= remainder (4 2) 0)?
(= 0 0)?
(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
(remainder (remainder 206 40) (remainder 40 6))
(remainder (remainder 206 40) 4)
(remainder 6 4)
2

; applicative-order evaluation

(gcd 206 40)
(= 40 0)?
(gcd 40 (remainder 206 40))
(gcd 40 6)

(= 6 0)?
(gcd 6 (remainder 40 6))
(gcd 6 4)

(= 4 0)?
(gcd 4 (remainder 6 4))
(gcd 4 2)

(= 2 0)?
(gcd 2 (remainder 4 2))
(gcd 2 0)

(= 0 0)?
2


