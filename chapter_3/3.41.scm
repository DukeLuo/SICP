;;; Exercise 3.41

;;; I don't think it is necessary to do this change.
;;; We introduced the serializer method in order to solve the problem of concurrent assignment of the common state variable.
;;; The read operation will not change the value of balance, so Ben's worry is not necessary.

