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

; 3. Необходимые функции, которые обрабатывают таблицу из 
; точечных пар: (страна . столица) и возвращают по стране – столицу,
; а по столице – страну.

(defun get-capital (state lst)
    (cond
        ((null lst) Nil)
        ((equal (car (car lst)) state) (cdr (car lst)))
        (T (get-capital state (cdr lst)))
    )
)

(defun get-state (capital lst)
    (cond
        ((null lst) Nil)
        ((equal (cdr (car lst)) capital) (car (car lst)))
        (T (get-state capital (cdr lst)))
    )
)

; 4. Функция swap-first-last, которая переставляет в 
; списке-аргументе первый и последний элементы.

(defun all-but-last-r (lst res)
    (if (null (cdr lst))
        res
        (all-but-last-r (cdr lst) (append res (cons (car lst) Nil)))
    )
)

(defun all-but-last (lst)
    (all-but-last-r lst Nil)
)

(defun swap-first-last (lst)
    (if (null (cdr lst))
        lst
        (append (last lst) (cdr (all-but-last lst)) (cons (car lst) Nil))
    )
)

; 5. Функция swap-two-element, которая переставляет в списке-аргументе 
; два указателя своими порядковыми номерами элемента в этом списке. 

(defun slice-len-r (lst i res)
    (if (or (null lst) (<= i 0))
        res
        (slice-len-r (cdr lst) (- i 1) (append res (cons (car lst) Nil)))
    )
)

(defun slice-len (lst i)
    (slice-len-r lst i Nil)
)

(defun slice-start-with (lst i)
    (if (or (null lst) (<= i 0))
        lst
        (slice-start-with (cdr lst) (- i 1))
    )
)

(defun my-nth (lst i)
    (cons (car (slice-start-with lst i)) Nil)
)

(defun slice-between (lst i j)
    (slice-len (slice-start-with lst i) (- j i))
)

(defun swap-two-element-r (lst i j)
    (if (null (cdr lst))
        lst
        (append
            (slice-len lst i)
            (my-nth lst j)
            (slice-between lst (+ i 1) j)
            (my-nth lst i)
            (slice-start-with lst (+ j 1))
        )
    )
)

(defun swap-two-element (lst i j)
    (cond 
        ((= i j) lst)
        ((> i j) (swap-two-element-r lst j i))
        (T (swap-two-element-r lst i j))
    )
)
