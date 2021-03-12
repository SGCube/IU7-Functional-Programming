; 1. Каковы результаты выражений?
(cons lst1 lst2)
(list lst1 lst2)
(append lst1 lst2)

; 2. Каковы результаты выражений?
(reverse ())
(last ())
(reverse '(a))
(last '(a))
(reverse '((a b c)))
(last '((a b c)))

; 3. Функция, которая возвращает последний элемент своего списка-аргумента.
; 3.1
(defun my-last (lst)
    (if (null (cdr lst)) 
        (car lst)
        (my-last (cdr lst))
    )
)
; 3.2
(defun my-last-2 (lst)
    (car (reverse lst))    
)

; 4. Функция, которая возвращает свой список-аргумент без последнего элемента. 
; 4.1
(defun no-last (lst)
    (if (null (cdr lst))
        Nil
        (cons (car lst) (no-last (cdr lst)))
    )    
)
; 4.2
(defun no-last-2 (lst)
    (reverse (cdr (reverse lst)))
)

; 5. Простой вариант игры в кости

; Функция, "бросающая" случайный образом кости
(defun roll-dice ()  (cons (+ (random 6) 1) (+ (random 6) 1)))
; Функция, складывающая числа на костях
(defun sum-dices (dice) (+ (car dice) (cdr dice)))
; Функция, определяющая абсолютную победу по выпавшим костям
(defun is-win (dice) 
    (or 
        (= 7 (setq dsum (sum-dices dice)))
        (= 11 dsum)
    )
)
; Функция, определяющая, может ли игрок кинуть заново
(defun is-retry (dice)
    (or (equal '(1.1) dice)
        (equal '(6.6) dice)
    )
)

; Функция хода
(defun play-turn (no)
    (print (format NIL "P~A: ~A" no (setq dice (roll-dice))))
    (if (is-win dice)
        (print (format NIL "P~A won!" no))
        (if (is-retry dice)
            (play-turn no)
            dice
        )
    ) 
)
; Функция игры
(defun play()
    (if (numberp (setq p1 (play-turn 1)))
        (if (numberp (setq p2 (play-turn 2)))
            (cond
                ((> p1 p2) (print "P1 won!"))
                ((> p2 p1) (print "P2 won!"))
                (T (print "Tie!"))
            )
        )
    )
)
