# Лабораторная работа №9

## Практические задания
### Задание 6.4
Написать функцию, которая выбирает из заданного списка только те числа,
которые больше 1 и меньше 10.
(Вариант: между двумя заданными границами.)
### Задание 6.5
Написать функцию, вычисляющую декартово произведение двух своих списков-аргументов. (Напомним, что А х В это множество всевозможных пар (a b), где а принадлежит А, принадлежит В.).
### Задание 6.6
Почему так реализовано reduce, в чем причина?
```
(reduce #'+ ()) -> 0
(reduce #'* ()) -> 1
(reduce #'append ()) -> nil
```
### Задание 6.7
Пусть list-of-list список, состоящий из списков. Написать функцию, которая вычисляет сумму длин всех элементов list-of-list, т.е. например для аргумента ((1 2) (3 4)) -> 4.
### Задание (подготовка к РК)
Используя рекурсию, написать функцию, которая по исходному списку строит список квадратов чисел смешанного структурированного списка.

## Теоретические вопросы
1. Классификация рекурсивных функций.