; 5.7

(defun multiply-by-numb (lst k)
    (cond
        ((null lst) Nil)
        (T (cons (* (car lst) k)
            (multiply-by-numb (cdr lst) k))
        )
    )
)

(defun multiply-by (lst k)
    (if (null lst) Nil
        (cons
            (cond
                ((listp (car lst)) (multiply-by (car lst) k))
                ((numberp (car lst)) (* (car lst) k))
                (T (car lst))
            )
            (multiply-by (cdr lst) k)
        )
    )
)

(defun multiply-by-numb-f (lst k)
    (mapcar #'(lambda (x) (* x k)) lst)
)

(defun multiply-by-f (lst k) 
    (mapcar #'(lambda (x)
            (cond
                ((listp x) (multiply-by x k))
                ((numberp x) (* x k))
                (T x)
            )
        )
        lst
    )
)

; 5.8

(defun select-between (lst a b) Nil)

; 6.2

(defun decrease-by-10 (lst) lst)

(defun decrease-by-10-f (lst) lst)

; 6.3

(defun get-first-arg (lst) Nil)

; numb-sum

(defun sum-all-numbers (lst) 0)
