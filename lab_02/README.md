# Лабораторная работа №2

## Задание 3

Что будет в результате вычисления выражений?

```
a) (CAADR ' ((blue cube) (red pyramid)))	
b) (CDAR '((abc) (def) (ghi)))
c) (CADR ' ((abc) (def) (ghi)))
d) (CADDR ' ((abc) (def) (ghi)))
```

## Задание 4

```
(list 'Fred 'and 'Wilma)
(list 'Fred ' (and Wilma))
(cons Nil Nil)
(cons T Nil)
(cons Nil T)
(list Nil)
(cons '(T) Nil)
(list ' (one two) ' (free temp))

(cons 'Fred '(and Wilma))
(cons 'Fred '(Wilma))
(list Nil Nil)
(list T Nil)
(list Nil T)
(cons T (list Nil))
(list '(T) Nil)
(cons '(one two) '(free temp))
```

## Задание 5
Написать функцию (f arl ar2 ar3 ar4), возвращающую список ((arl ar2) (ar3 ar4)).

Написать функцию (f arl ar2), возвращающую ((arl) (ar2)).

Написать функцию (f arl), возвращающую (((arl))).

Представить результаты в виде списочных ячеек.

