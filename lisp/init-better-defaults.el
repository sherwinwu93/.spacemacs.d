;; --------------------Display
;; (set-frame-position (selected-frame) 800 100)
;; (set-frame-width (selected-frame) 110)
;; (set-frame-height (selected-frame) 50)
(delete-selection-mode t)
;; --------------------Command
;; 移动到最后并执行代码
(defun wusd/eval-last-sexp()
  (interactive)
  (execute-kbd-macro (kbd "<escape>"))
  (execute-kbd-macro (kbd "A"))
  (execute-kbd-macro (kbd "C-x C-e"))
  (execute-kbd-macro (kbd "<escape>")))



(provide 'init-better-defaults)
