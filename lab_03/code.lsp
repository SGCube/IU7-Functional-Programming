; 2. Функция, вычисляющая гипотенузу прямоугольного треугольника по заданным катетам
(defun hypot (cath1 cath2) (sqrt (+ (* cath1 cath1) (* cath2 cath2))))
(hypot 3 4)

; 3. Функция, вычисляющая объём параллелепипеда по трём его сторонам
(defun v (a1 a2 a3) (* a1 a2 a3))
(v 3 4 5)

; 4. Выражения
(list 'a 'c)
(cons 'a (b c))
(cons 'a '(b c))
(caddr (1 2 3 4 5))
(cons 'a 'b 'c)
(list 'a (b c))
(list a '(b c))
(list (+ 1 '(length '(1 2 3))))

; 5. Функция longer_then от двух списков-аргументов, которая возвращает T, если первый аргумент имеет большую длину
; с использованием length
(defun longer_then (list1 list2) (> (length list1) (length list2)))
(longer_then '('a) nil)
(longer_then '('a 'b) '('a ))
(longer_then '('a 'b) '('a 'b))
(longer_then '('a 'b 'c) '('a '('a 'b) 'c))
; с использованием базисных функций
(defun longer_then_2 (list1 list2)
		(cond ((null list1) nil)
			  ((null list2) T)
			  (T (longer_then_2 (cdr list1) (cdr list2)))
		)
)
(longer_then_2 '('a) nil)
(longer_then_2 '('a 'b) '('a ))
(longer_then_2 '('a 'b) '('a 'b))
(longer_then_2 '('a 'b 'c) '('a '('a 'b) 'c))

; 6. Выражения
(cons 3 (list 5 6))
(cons 3 '(list 5 6))
(list 3 'from 9 'gives (- 9 3))
(+ (length '(1 foo 2 too)) (car '(21 22 23)))
(cdr '(cons is short for ans))
(car (list one two))
(car (list 'one 'two))

; 6 (2). 
(defun mystery (x) (list (second x) (first x)))
(mystery '(one two))
(mystery (last '(one two)))
(mystery '(free))
