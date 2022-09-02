(use-package xscheme
  :load-path "~/.spacemacs.d/lisp/extensions/"
  )

(setq scheme-program-name "/usr/local/bin/mit-scheme --stack 10000")

(defun wusd/open-mit-scheme()
  (interactive)
  (execute-kbd-macro (kbd "C-x 2"))
  (execute-kbd-macro (kbd "C-x o"))
  (run-scheme "scheme --heap 512")
  (execute-kbd-macro (kbd "C-x o"))
  )

(provide 'init-scheme)
