; 1. Функция, которая принимает целое число и возвращает первое четное число, не меньшее аргумента.
(defun even-near (x) (if (= (rem x 2) 0) x (+ x 1)))
(defun even-near-2 (x) (if (evenp x) x (+ x 1)))

; 2. Функция, которая принимает число и возращает число того же знака, но с модулем на 1 больше аргумента
(defun mod+1 (x) 
    (if (= x 0) 1 
        (* (/ x (abs x)) (+ (abs x) 1))))

(defun mod+1_2 (x) 
    (if (minusp x) (- x 1) (+ x 1))


; 3. Функция, которая принимает два числа и возвращает список из этих чисел, расположенный по возрастанию
(defun two-in-order (x y)
    (if (> x y) (list y x) (list x y)))

; 4. Функция, которая принимает три числа и возращает T только тогда, когда первое число расположено между вторым и третим
; 8. Решить задачу 4, используя для ее решения конструкции IF, COND, AND/OR.

(defun is-between-or-and (x y z)
    (and (or (and (<= y x) (<= x z)) (and (<= z x) (<= x y))) T)
)

(defun is-between-cond (x y z)
    (cond
        ((<= y x) (<= x z))
        ((<= z x) (<= x y))
    )
)

(defun is-between-if (x y z)
    (if (<= y x) (<= x z)
        (if (<= z x) (<= x y)
            Nil
        )
    )
)

;5. Каков результат вычисления следующих выражений:
(and 'fee 'fie 'foe)
(or 'fee 'fie 'foe)

(and nil 'fie 'foe)
(or nil 'fie 'foe)

(and (equal 'abc 'abc) 'yes)
(or (equal 'abc 'abc) 'yes)

; 6 Предикат, который принимает два числа-аргумента и возвращает T, если первое число не меньше второго
; ???
(defun fun (x y) (>= x y))

; 7 

; 9 how-alike

; из лекции
(defun how-alike (x y)
    (cond ((or (= x y) (equal x y)) 'the_same)
        ((and (oddp x) (oddp y)) 'both_odd)
        ((and (evenp x) (evenp y)) 'both_even)
        (t 'difference)
    )
)

; с использованием if, or, and
(defun how-alike-2 (x y)
    (if (or (= x y) (equal x y)) 'the_same
        (if (and (oddp x) (oddp y)) 'both_odd
            (if (and (evenp x) (evenp y)) 'both_even 'difference)
        )
    )
)

; только if
(defun how-alike-if (x y)
    (if (= x y) 'the_same
        (if (equal x y) 'the_same
            (if (oddp x) 
                (if (oddp y) 'both_odd
                    (if (evenp x)
                        (if (evenp y) 'both_even 'difference)
                        'difference
                    )
                )
                (if (evenp x)
                    (if (evenp y) 'both_even 'difference)
                    'difference
                )
            )
        )
    )
)

; только or и and
(defun how-alike-or-and (x y)
    (or (and (or (= x y) (equal x y)) 'the_same)
        (and (and (oddp x) (oddp y)) 'both_odd)
        (and (and (evenp x) (evenp y)) 'both_even)
        'difference))



; только cond
(defun how-alike-cond (x y)
    (cond 
        ((= x y) 'the_same)
        ((equal x y) 'the_same)
        ((cond 
            ((oddp x) (oddp y))
            (t Nil)
        ) 'both_odd)
        ((cond 
            ((evenp x) (evenp y))
            (t Nil)
        ) 'both_even)
        (t 'difference)
    )
)
