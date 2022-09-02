(use-package youdao-dictionary)
(fset 'wusd/complete-pronounce
      (kmacro-lambda-form [?  ?w ?w ?y ?$ ?  ?w ?w ?p] 0 "%d"))
;; 缓存翻译
(setq url-automatic-caching t)

(provide 'init-translate)

