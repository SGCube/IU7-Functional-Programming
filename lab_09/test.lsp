; Предикат set-equal

(defun search-in-set (x set)
    (cond
        ((null set) Nil)
        ((equalp x (car set)) T)
        (T (search-in-set x (cdr set)))
    )
)

(defun my-subsetp (set1 set2) 
    (cond
        ((null set1) T)
        ((search-in-set (car set1) set2) (my-subsetp (cdr set1) set2))
        (T Nil)
    )
)

(defun set-equal (set1 set2)
    (cond
        ((and (null set1) (null set2)) T)
        ((or (null set1) (null set2)) Nil)
        (T (and (my-subsetp set1 set2) (my-subsetp set2 set1)))
    )
)

(test-all (list 

(test-func-group 
    "6.4.r. select-between"
    #'select-between
    '(
        (() 0 8)
        ((5) 0 8)
        ((5) -1 2)
        ((5 1 4 3 4 2 3) 0 3)
        ((5 (1 4 (3)) 4 (2 1)) 0 3)
    )
    '(()(5)()(3 2 3 1)(1 2 3 1))
    #'equalp
)

(test-func-group 
    "6.4.f. select-between"
    #'select-between-f
    '(
        (() 0 8)
        ((5) 0 8)
        ((5) -1 2)
        ((5 1 4 3 4 2 3) 0 3)
        ((5 (1 4 (3)) 4 (2 1)) 0 3)
    )
    '(()(5)()(3 2 3 1)(1 2 3 1))
    #'equalp
)

(test-func-group 
    "6.5. decart"
    #'decart
    '(
        (() ())
        ((5) (4))
        ((5 1) (3 4))
        ((5 1 3) (5 3))
        ((5 1 5 3) (8 8))
    )
    '(
        ()
        ((5 . 4))
        ((5 . 3) (5 . 4) (1 . 3) (1 . 4))
        ((5 . 5) (5 . 3) (1 . 5) (1 . 3) (3 . 5) (3 . 3))
        ((5 . 8) (1 . 8) (3 . 8))
    )
    #'set-equal
)

(test-func-group 
    "6.7. sum-len"
    #'sum-len
    '(
        (())
        ((5 1 6 A 4))
        ((5 A (A 4 (5 6)) 0.1 T B C (S 4) 4))
        (((5 A (A 4 (5 6))) 0.1 T B C (S 4) 4))
        ((((5 A) (A 4 (5 6))) 0.1 T B C (S 4) 4))
    )
    '(0 5 12 10 9)
)

))
