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

))
