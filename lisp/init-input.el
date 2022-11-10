(use-package evil-fcitx
  :load-path "~/.spacemacs.d/lisp/extensions/")
(use-package rime)
;; 输入法显示框
(setq rime-show-candidate 'minibuffer)
;; (setq rime-show-candidate 'message)
;; (setq rime-show-candidate 'popup)
;; (setq rime-show-candidate 'sidewindow)
;; (setq rime-popup-style 'simple)
;; (setq rime-sidewindow-keep-window t)
(setq default-input-method "rime")
(setq rime-user-data-dir "/usr/local/rime")

(defun rime-dirs()
  (interactive)
  (find-file "/usr/local/rime"))
(provide 'init-input)
