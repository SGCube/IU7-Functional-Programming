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

(defun test-func-group (name func args expected &optional (eqfunc #'equal))
    (test-group
        name
        (mapcar #'(lambda (x)
                (apply func x)
            ) args
        )
        expected
        eqfunc
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