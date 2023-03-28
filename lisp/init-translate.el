(use-package youdao-dictionary
  :load-path "~/.spacemacs.d/lisp/extensions/")
(setq url-automatic-caching t)

(fset 'wusd/add-pronunciation
   (kmacro-lambda-form [?j ?0 ?v ?e f7 ?  tab ?y ?$ ?  tab ?p] 0 "%d"))

(fset 'youdao-quick-translate
   (kmacro-lambda-form [?j ?0 ?v ?e f9] 0 "%d"))

(use-package bing-dict 
  :load-path "~/.spacemacs.d/lisp/extensions/bing-dict.el/")

(global-set-key (kbd "C-c d") 'bing-dict-brief)
(setq bing-dict-vocabulary-save t)
(setq bing-dict-vocabulary-file "~/notes/your_vocabulary.org")

(provide 'init-translate)

