;; ------------------------------------------------------------better-defaults
;; 移动到最后并执行代码
(defun wusd/eval-last-sexp()
  (interactive)
  (execute-kbd-macro (kbd "<escape>"))
  (execute-kbd-macro (kbd "A"))
  (execute-kbd-macro (kbd "C-x C-e"))
  (execute-kbd-macro (kbd "<escape>")))
;;
(defun wusd/insert-two-spaces()
  (interactive)
  (insert "  "))

(defun wusd/open-mit-scheme()
  (interactive)
  (execute-kbd-macro (kbd "C-x 2"))
  (execute-kbd-macro (kbd "C-x o"))
  (run-scheme "scheme --heap 512")
  (execute-kbd-macro (kbd "C-x o"))
  )
(defun todo-dirs()
  (interactive)
  (find-file "~/notes/todos/"))

(fset '<s
      (kmacro-lambda-form [?\C-a ?# ?+ ?B ?E ?I backspace ?G ?I ?N ?_ ?S ?R ?C return ?# ?+ ?E ?N ?D ?_ ?S ?R ?C ?\C-p ?\C-e ? ] 0 "%d"))
(fset 'sc
      (kmacro-lambda-form [?\C-x ?o ?\C-x ?b ?* ?s ?c ?h ?e ?m ?e ?* return ?\C-x ?o] 0 "%d"))
(fset 'init-scm
      (kmacro-lambda-form [?\( ?l ?o ?a ?d ?  ?\" ?~ ?/ ?l ?o ?c ?a ?l ?c ?o ?d ?e ?s ?/ ?s ?i ?c ?p ?/ ?i ?n ?i ?t ?. ?s ?c ?m ?\" ?\) ?x backspace ?\C-x ?\C-e] 0 "%d"))
;; macro
(fset 'wusd/complete-pronounce
      (kmacro-lambda-form [?  ?w ?w ?y ?$ ?  ?w ?w ?p] 0 "%d"))
(fset 'wusd/ivy-push-view
      (kmacro-lambda-form [?\M-x ?i ?v ?y ?- ?p ?u ?s ?h ?- ?v ?i ?e ?w return return] 0 "%d"))
(fset 'wusd/ivy-pop-view
      (kmacro-lambda-form [?\M-x ?i ?v ?y ?- ?p ?o ?p ?- ?v ?i ?e ?w return return] 0 "%d"))

(provide 'init-funcs)
