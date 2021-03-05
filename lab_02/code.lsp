; 2. Выражения, возвращающие второй, третий и четвёртый элементы заданного списка соответственно
(car (cdr '((open1) (close2) (halph3))))
; -> (CLOSE2)
(car (cdr (cdr '(open close halph))))
; -> HALPH
(car (cdr (cdr (cdr '((one) for all (and(me(for you))))))))
; -> (AND (ME (FOR YOU)))

; 3. Выражения
(caadr '((blue cube) (red pyramid)))
(cdar '((abc) (def) (ghi)))
(cadr '((abc) (def) (ghi)))
(caadr '((abc) (def) (ghi)))

; 4. Выражения
(list 'Fred 'and Wilma)
(list 'Fred '(and Wilma))
(cons Nil Nil)
(cons T Nil)
(cons Nil T)
(list Nil)
(cons (T) Nil)
(cons '(T) Nil)
(list '(one two) '(free temp))
(cons 'Fred '(and Wilma))
(cons 'Fred '(Wilma))
(list Nil Nil)
(list T Nil)
(list Nil T)
(cons T (list Nil))
(list (T) Nil)
(list '(T) Nil)
(cons '(one two) '(free temp))

; 5.1. Функция (f ar1 ar2 ar3 ar4), возвращающая список ((ar1 ar2) (ar3 ar4))
(defun f1_1 (ar1 ar2 ar3 ar4) (list (list ar1 ar2) (list ar3 ar4)))
(defun f1_2 (cons (cons ar1 (cons ar2 nil)) (cons (cons ar3 (cons ar4 nil)) nil)))
(defun f1_3 (ar1 ar2 ar3 ar4) `((,ar1 ,ar2) (,ar3 ,ar4)))

; 5.2. Функция (f ar1 ar2), возвращающая список ((ar1) (ar2))
(defun f2_1 (ar1 ar2) (list (list ar1) (list ar2)))
(defun f2_2 (ar1 ar2) (cons (cons ar1 nil) (cons (cons ar2 nil) nil)))
(defun f2_3 (ar1 ar2) `((,ar1) (,ar2)))

; 5.3 Функция (f ar1), возвращающая список (((ar1)))
(defun f3_1 (ar1) (list (list (list ar1))))
(defun f3_2 (ar1) (cons (cons (cons ar1 nil) nil) nil))
(defun f3_3 (ar1) `(((,ar1))))
