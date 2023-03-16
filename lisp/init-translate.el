(use-package youdao-dictionary
  :load-path "~/.spacemacs.d/lisp/extensions/")
(setq url-automatic-caching t)

(fset 'wusd/add-pronunciation
   (kmacro-lambda-form [?j ?0 ?v ?e f10 ?  tab ?y ?$ ?  tab ?p] 0 "%d"))

(fset 'youdao-quick-translate
   (kmacro-lambda-form [?j ?0 ?v ?e f9] 0 "%d"))

(provide 'init-translate)

