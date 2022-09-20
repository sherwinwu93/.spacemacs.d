(defun centaur-tabs-hide-tab (x)
  "Do no to show buffer X in tabs."
  (let ((name (format "%s" x)))
    (or
     ;; Current window is not dedicated window.
     (window-dedicated-p (selected-window))

     ;; Buffer name not match below blacklist.
     (string-prefix-p "*" name)
     (string-prefix-p "*epc" name)
     (string-prefix-p "*helm" name)
     (string-prefix-p "*Helm" name)
     (string-prefix-p "*Compile-Log*" name)
     (string-prefix-p "*lsp" name)
     (string-prefix-p "*company" name)
     (string-prefix-p "*Flycheck" name)
     (string-prefix-p "*tramp" name)
     (string-prefix-p " *Mini" name)
     (string-prefix-p "*help" name)
     (string-prefix-p "*straight" name)
     (string-prefix-p " *temp" name)
     (string-prefix-p "*Help" name)
     (string-prefix-p "*mybuf" name)

     ;; Is not magit buffer.
     (and (string-prefix-p "magit" name)
	        (not (file-name-extension name)))
     )))
;; --------------------Display
(set-frame-position (selected-frame) 800 100)
(set-frame-width (selected-frame) 110)
(set-frame-height (selected-frame) 50)
;; --------------------Command
;; 移动到最后并执行代码
(defun wusd/eval-last-sexp()
  (interactive)
  (execute-kbd-macro (kbd "<escape>"))
  (execute-kbd-macro (kbd "A"))
  (execute-kbd-macro (kbd "C-x C-e"))
  (execute-kbd-macro (kbd "<escape>")))



(provide 'init-better-defaults)
