(defun mystery (x) (list (second x) (first x)))

(print (mystery '(one two)))
(print (mystery (last '(one two))))
(print (mystery '(free)))