(defun test (result expected &optional (eqfunc #'equal))
    (funcall eqfunc result expected)
)

(defun get-total (tests)
    (cons
        (reduce #'(lambda (x y)
                (+ x (if (null y) 0 1))
            )
            tests :initial-value 0
        )
        (length tests)
    )
)

(defun print-test-results (name tests total)
    (cons total
        (format T "~%~A~%~A~%Total: ~A/~A~%"
            name 
            tests
            (car total)
            (cdr total)
        )
    )
)

(defun test-group-post (name tests)
    (car (print-test-results name tests (get-total tests)))
)

(defun test-group (name result expected &optional (eqfunc #'equal))
    (test-group-post
        name
        (mapcar #'(lambda (x y) (test x y eqfunc))
            result expected
        )
    )
)

(defun print-test-all (total)
    (format T "~%Overall Total: ~A/~A"
        (car total)
        (cdr total)
    )
)

(defun test-all (test-groups)
    (print-test-all
        (reduce #'(lambda (x y)
                (cons (+ (car x) (car y)) (+ (cdr x) (cdr y)))
            )
            test-groups
            :initial-value '(0 . 0)
        )
    )
)

(test-all (list 

(test-group 
    "5.7.a.r. multiply-by"
    (list 
        (multiply-by-numb '() 10)
        (multiply-by-numb '(5) 10)
        (multiply-by-numb '(5) 0.1)
        (multiply-by-numb '(5) -10)
        (multiply-by-numb '(5) 0)
        (multiply-by-numb '(5 1 0.2 4) 0)
        (multiply-by-numb '(5 1 0.2 4) 10)
    )
    '(()(50)(0.5)(-50)(0)(0 0 0 0)(50 10 2 40))
    #'equalp
)

(test-group 
    "5.7.b.r. multiply-by"
    (list 
        (multiply-by '() 10)
        (multiply-by '(5) 10)
        (multiply-by '(5) 0.1)
        (multiply-by '(5) -10)
        (multiply-by '(5) 0)
        (multiply-by '(5 1 0.2 4) 0)
        (multiply-by '(5 1 0.2 4) 10)
        (multiply-by '(5 A (A 4 (5 6)) 0.1 T B C (S 4) 4) 2)
    )
    '(()(50)(0.5)(-50)(0)(0 0 0 0)(50 10 2 40)
        (10 A (A 8 (10 12)) 0.2 T B C (S 8) 8) 4)
    #'equalp
)

(test-group 
    "5.7.a.f. multiply-by"
    (list 
        (multiply-by-numb-f '() 10)
        (multiply-by-numb-f '(5) 10)
        (multiply-by-numb-f '(5) 0.1)
        (multiply-by-numb-f '(5) -10)
        (multiply-by-numb-f '(5) 0)
        (multiply-by-numb-f '(5 1 0.2 4) 0)
        (multiply-by-numb-f '(5 1 0.2 4) 10)
    )
    '(()(50)(0.5)(-50)(0)(0 0 0 0)(50 10 2 40))
    #'equalp
)

(test-group 
    "5.7.b.f. multiply-by"
    (list 
        (multiply-by-f '() 10)
        (multiply-by-f '(5) 10)
        (multiply-by-f '(5) 0.1)
        (multiply-by-f '(5) -10)
        (multiply-by-f '(5) 0)
        (multiply-by-f '(5 1 0.2 4) 0)
        (multiply-by-f '(5 1 0.2 4) 10)
        (multiply-by-f '(5 A (A 4 (5 6)) 0.1 T B C (S 4) 4) 2)
    )
    '(()(50)(0.5)(-50)(0)(0 0 0 0)(50 10 2 40)
        (10 A (A 8 (10 12)) 0.2 T B C (S 8) 8) 4)
    #'equalp
)

(test-group 
    "5.8. select-between"
    (list 
        (select-between '() 0 8)
        (select-between '(5) 0 8)
        (select-between '(5) -1 2)
        (select-between '(5 1 4 3 4 2 1) 0 3)
    )
    '(()(5)()(1 1 2 3))
    #'equalp
)

(test-group 
    "6.2.r. decrease-by-10"
    (list 
        (decrease-by-10 '())
        (decrease-by-10 '(5))
        (decrease-by-10 '(A))
        (decrease-by-10 '(5 10 4 -3))
        (decrease-by-10 '(5 10 A -3))
        (decrease-by-10'(5 A (A 4 (5 6)) 0.1 T B C (S 4) 4))
    )
    '(()(-5)(A)(-10 0 -9 -13)(-10 0 A -13)
        (-5 A (A -6 (-5 1)) -9.9 T B C (S -6) -6) -8)
    #'equalp
)

(test-group 
    "6.2.r. decrease-by-10"
    (list 
        (decrease-by-10-f '())
        (decrease-by-10-f '(5))
        (decrease-by-10-f '(A))
        (decrease-by-10-f '(5 10 4 -3))
        (decrease-by-10-f '(5 10 A -3))
        (decrease-by-10-f '(5 A (A 4 (5 6)) 0.1 T B C (S 4) 4))
    )
    '(()(-5)(A)(-10 0 -9 -13)(-10 0 A -13)
        (-5 A (A -6 (-5 1)) -9.9 T B C (S -6) -6) -8)
    #'equalp
)

(test-group 
    "6.3. get-first-arg"
    (list 
        (get-first-arg '())
        (get-first-arg '(5 1 6 A 4))
        (get-first-arg '(5 A (A 4 (5 6)) 0.1 T B C (S 4) 4))
        (get-first-arg '((5 A (A 4 (5 6))) 0.1 T B C (S 4) 4))
        (get-first-arg '(((5 A) (A 4 (5 6))) 0.1 T B C (S 4) 4))
        (get-first-arg '(((5 A (A 4 (5 6)))) 0.1 T B C (S 4) 4))
        (get-first-arg '((((5))) A (A 4 (5 6)) 0.1 T B C (S 4) 4))
    )
    '(Nil 5 5 5 5 5 5)
)

(test-group 
    "sum-all-numbers"
    (list 
        (sum-all-numbers '())
        (sum-all-numbers '(A B DE E C))
        (sum-all-numbers '(5 4 10 5 1))
        (sum-all-numbers '(5 1 6 A 4))
        (sum-all-numbers '(5 A (A 4 (5 6)) 0.1 T B C (S 4) 4))
    )
    '(0 0 25 16 28.1)
)

))
