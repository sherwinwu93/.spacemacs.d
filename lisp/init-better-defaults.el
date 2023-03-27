;; --------------------Display
;; (set-frame-position (selected-frame) 800 100)
;; (set-frame-width (selected-frame) 110)
;; (set-frame-height (selected-frame) 50)
(delete-selection-mode t)
;; --------------------Command
;; 移动到最后并执行代码
(fset 'wusd/eval-last-sexp
      (kmacro-lambda-form [escape ?A ?\C-e escape escape] 0 "%d"))

(fset 'wusd/quick-buffer
   (kmacro-lambda-form [?\M-m ?b ?b return] 0 "%d"))

(provide 'init-better-defaults)
