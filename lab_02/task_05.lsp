(defun f1_1 (ar1 ar2 ar3 ar4) (list (list ar1 ar2) (list ar3 ar4)))
(defun f1_2 (cons (cons ar1 (cons ar2 nil)) (cons (cons ar3 (cons ar4 nil)) nil)))
(defun f1_3 (ar1 ar2 ar3 ar4) `((,ar1 ,ar2) (,ar3 ,ar4)))

(defun f2_1 (ar1 ar2) (list (list ar1) (list ar2)))
(defun f2_2 (ar1 ar2) (cons (cons ar1 nil) (cons (cons ar2 nil) nil)))
(defun f2_3 (ar1 ar2) `((,ar1) (,ar2)))

(defun f3_1 (ar1) (list (list (list ar1))))
(defun f3_2 (ar1) (cons (cons (cons ar1 nil) nil) nil))
(defun f3_3 (ar1) `(((,ar1))))