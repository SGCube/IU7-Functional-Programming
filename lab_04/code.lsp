; 7. Функция, которая переводит температуру в системе Фаренгейта в температуру по Цельсию
(defun f-to-c (temp) (/ (* 5 (- temp 32)) 9.0))
(f-to-c 451)

; 8. Выражения
(list 'cons t NIL)
(eval (list 'cons t NIL))
(eval (eval (list 'cons t NIL)))
(apply #'cons '(t NIL))
(eval NIL)
(list 'eval NIL)
(eval (list 'eval NIL))

; Доп1. Функция, вычисляющая катет по заданной гипотенузе и другому катету прямоугольного треугольника
(defun cath (hyp leg) (sqrt (- (* hyp hyp) (* leg leg))))
(cath 5 4)

; Доп2. Функция, вычисляющая площадь трапеции по ее основаниям и высоте
(defun sq_trapez (base1 base2 height) (/ (* (+ base1 base2) height) 2.0))
(sq_trapez 5 10 15)
