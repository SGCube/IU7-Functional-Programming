; 1. Функция, которая по своему списку-аргументу lst определяет, 
; является ли он палиндромом (т. е. равны ли lst и ‘(reverse lst)).

(defun my-reverse (lst)
    (funcall
        (defun revers (src res)
            (cond 
                ((null src) res)
                (T (revers (cdr src) (cons (car src) res)))
            )
        )
        lst Nil
    )
)

(defun pal (lst rev len)
    (cond
        ((<= len 1) T)
        ((equal (car lst) (car rev))
            (pal (cdr lst) (cdr rev) (- len 2)))
    )
)

(defun palindrom (lst)
    (apply #'pal (list lst (my-reverse lst) (length lst)))
)


; 2. Предикат set-equal, которые возвращает T, если два его
; множества-аргумента содержат одни и те же элементы, 
; порядок которых не имеет значения. 

(defun search-in-set (x set)
    (cond
        ((null set) Nil)
        ((equal x (car set)) T)
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
