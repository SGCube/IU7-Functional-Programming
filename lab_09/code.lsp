; 6.4

(defun is-between (x a b)
    (and (<= a x) (<= x b))
)

(defun sel-between-r (lst a b res)
    (if (null lst) res
        (sel-between-r (cdr lst) a b 
            (cond
                ((listp (car lst)) (sel-between-r (car lst) a b res))
                ((and (numberp (car lst)) (is-between (car lst) a b))
                    (cons (car lst) res))
                (T res)
            )
        )
    )
)

(defun select-between (lst a b)
    (cond
        ((null lst) Nil)
        ((> a b) (sel-between-r lst b a Nil))
        (T (sel-between-r lst a b Nil))
    )
)

(defun sel-between-f (lst a b res)
	(reduce #'(lambda (xlst x)
            (cond
                ((listp x) (sel-between-f x a b xlst))
                ((and (numberp x) (is-between x a b)) (cons x xlst))
                (T xlst)
            )
        )
		lst
        :initial-value res
    )
)

(defun select-between-f (lst a b)
    (cond
        ((null lst) Nil)
        ((> a b) (sel-between-f lst b a Nil))
        (T (sel-between-f lst a b Nil))
    )
)
