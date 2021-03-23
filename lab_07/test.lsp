(defun test (result expected)
    (print (equal result expected))
)

; 1
(prin1 "1. palindrom")
(test (palindrom '(A B B C B B A)) T)
(test (palindrom '(A B B C C B B A)) T)
(test (palindrom '(A B B C C B D A)) Nil)
(test (palindrom '(A B B C C B B C C B B A)) T)
(test (palindrom '(A A)) T)
(test (palindrom '(B A)) Nil)
(test (palindrom '(A)) T)
(test (palindrom '()) T)

; 2
(print "\n2. set-equal")
(test (set-equal '() '()) T)
(test (set-equal '(A B) '()) Nil)
(test (set-equal '() '(A B)) Nil)
(test (set-equal '(A B C) '(A B C)) T)
(test (set-equal '(A B C)) '(C A B)) T)
(test (set-equal '(A E D C B) '(A E F C D)) Nil)
(test (set-equal '(A E D C B) '(A E C D)) Nil)
(test (set-equal '(A E D) '(A E F C D)) Nil)