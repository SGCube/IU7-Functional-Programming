(test-all (list 

(test-func-group 
    "5.7.a.r. multiply-by"
    #'multiply-by-numb
    '(
        (() 10)
        ((5) 10)
        ((5) 0.1)
        ((5) -10)
        ((5) 0)
        ((5 1 0.2 4) 0)
        ((5 1 0.2 4) 10)
    )
    '(()(50)(0.5)(-50)(0)(0 0 0 0)(50 10 2 40))
    #'equalp
)

(test-func-group
    "5.7.b.r. multiply-by"
    #'multiply-by 
    '(
        (() 10)
        ((5) 10)
        ((5) 0.1)
        ((5) -10)
        ((5) 0)
        ((5 1 0.2 4) 0)
        ((5 1 0.2 4) 10)
        ((5 A (A 4 (5 6)) 0.1 T B C (S 4) 4) 2)
    )
    '(()(50)(0.5)(-50)(0)(0 0 0 0)(50 10 2 40)
        (10 A (A 8 (10 12)) 0.2 T B C (S 8) 8) 4)
    #'equalp
)

(test-func-group 
    "5.7.a.f. multiply-by"
    #'multiply-by-numb-f
    '(
        (() 10)
        ((5) 10)
        ((5) 0.1)
        ((5) -10)
        ((5) 0)
        ((5 1 0.2 4) 0)
        ((5 1 0.2 4) 10)
    )
    '(()(50)(0.5)(-50)(0)(0 0 0 0)(50 10 2 40))
    #'equalp
)

(test-func-group 
    "5.7.b.f. multiply-by"
    #'multiply-by-f
    '(
        (() 10)
        ((5) 10)
        ((5) 0.1)
        ((5) -10)
        ((5) 0)
        ((5 1 0.2 4) 0)
        ((5 1 0.2 4) 10)
        ((5 A (A 4 (5 6)) 0.1 T B C (S 4) 4) 2)
    )
    '(()(50)(0.5)(-50)(0)(0 0 0 0)(50 10 2 40)
        (10 A (A 8 (10 12)) 0.2 T B C (S 8) 8) 4)
    #'equalp
)

(test-func-group 
    "5.8.r. select-between"
    #'select-between
    '(
        (() 0 8)
        ((5) 0 8)
        ((5) -1 2)
        ((5 1 4 3 4 2 3) 0 1)
        ((5 1 4 3 4 2 1) 0 3)
    )
    '(()(5)()(1)(1 1 2 3))
    #'equalp
)

(test-func-group 
    "5.8.f. select-between"
    #'select-between-f
    '(
        (() 0 8)
        ((5) 0 8)
        ((5) -1 2)
        ((5 1 4 3 4 2 3) 0 1)
        ((5 1 4 3 4 2 1) 0 3)
    )
    '(()(5)()(1)(1 1 2 3))
    #'equalp
)

(test-func-group 
    "6.2.r. decrease-by-10"
    #'decrease-by-10
    '(
        (())
        ((5))
        ((A))
        ((5 10 4 -3))
        ((5 10 A -3))
        ((5 A (A 4 (5 6)) 0.1 T B C (S 4) 4))
    )
    '(()(-5)(A)(-5 0 -6 -13)(-5 0 A -13)
        (-5 A (A -6 (-5 -4)) -9.9 T B C (S -6) -6) -8)
    #'equalp
)

(test-func-group 
    "6.2.r. decrease-by-10"
    #'decrease-by-10-f
    '(
        (())
        ((5))
        ((A))
        ((5 10 4 -3))
        ((5 10 A -3))
        ((5 A (A 4 (5 6)) 0.1 T B C (S 4) 4))
    )
    '(()(-5)(A)(-5 0 -6 -13)(-5 0 A -13)
        (-5 A (A -6 (-5 -4)) -9.9 T B C (S -6) -6) -8)
    #'equalp
)

(test-func-group 
    "6.3. get-first-arg"
    #'get-first-arg
    '(
        (())
        ((5 1 6 A 4))
        ((5 A (A 4 (5 6)) 0.1 T B C (S 4) 4))
        (((5 A (A 4 (5 6))) 0.1 T B C (S 4) 4))
        ((((5 A) (A 4 (5 6))) 0.1 T B C (S 4) 4))
    )
    '(Nil Nil (A 4 (5 6)) (5 A (A 4 (5 6))) ((5 A) (A 4 (5 6))))
)

(test-func-group 
    "sum-all-numbers"
    #'sum-all-numbers
    '( 
        (())
        ((A B DE E C))
        ((5 4 10 5 1))
        ((5 1 6 A 4))
        ((5 A (A 4 (5 6)) 0.1 T B C (S 4) 4))
    )
    '(0 0 25 16 28.1)
)

(test-func-group 
    "sum-all-numbers-r"
    #'sum-all-numbers-r
    '( 
        (())
        ((A B DE E C))
        ((5 4 10 5 1))
        ((5 1 6 A 4))
        ((5 A (A 4 (5 6)) 0.1 T B C (S 4) 4))
    )
    '(0 0 25 16 28.1)
)

))
