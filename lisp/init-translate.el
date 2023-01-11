(use-package youdao-dictionary
  :load-path "~/.spacemacs.d/lisp/extensions/")
(setq url-automatic-caching t)

(fset 'wusd/complete-pronounce
      (kmacro-lambda-form [?  ?w ?w ?y ?$ ?  ?w ?w ?p] 0 "%d"))
(fset 'youdao-quick-translate
   (kmacro-lambda-form [?j ?0 ?v ?e f9] 0 "%d"))

(provide 'init-translate)

