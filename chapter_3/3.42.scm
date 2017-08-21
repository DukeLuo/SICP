;;; Exercise 3.42

;;; I think this change is safe.
;;; All calls to a given serializer return serialized procedures in the same set,
;;; Ben's make-account and the original one have their own serializer, and the amount of each is one.
;;; the only difference is new one serialize the procedures before calling the functions, but the original one does it when calls withdraw or deposit.

