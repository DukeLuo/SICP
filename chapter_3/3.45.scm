;;; Exercise 3.45

;;; In Louis' method, make-account-and-serializer completes the serialization when we call it, but it still exports the serializer,
;;; this may cause serialize more than once.
;;; When serialized-exchange is called, it will cause the situation I mentioned above.
;;; Serialized-exchange is called from an environment protected by both two serializers. 
;;; In that environment,when running the ((account1 'withdraw) difference), it need call the withdraw procedure.
;;; but the withdraw and serialized-exchange are in the same set, and serializer allow only one execution of a procedure in the set, 
;;; so withdraw can’t be evaluated.

