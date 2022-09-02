(defun set-bigger-spacing ()
  (setq-local default-text-properties '(line-spacing 0.2 line-height 1.2)))
(add-hook 'text-mode-hook 'set-bigger-spacing)
(add-hook 'prog-mode-hook 'set-bigger-spacing)
;; ----------------------------------------Abbreviation
(setq-default abbrev-mode t)
(read-abbrev-file "~/.spacemacs.d/abbrev_defs")
;; ----------------------------------------bookmarks
(setq-default bookmark-default-file "~/.spacemacs.d/bookmarks")

;; ----------------------------------------tab
(setq custom-tab-width 2)

;; Two callable functions for enabling/disabling tabs in Emacs
(defun disable-tabs () (setq indent-tabs-mode nil))
(defun enable-tabs ()
	(local-set-key (kbd "TAB") 'tab-to-tab-stop)
	(setq indent-tabs-mode t)
	(setq tab-width custom-tab-width))
(add-hook 'prog-mode-hook 'enable-tabs)
(add-hook 'text-mode-hook 'enable-tabs)
(add-hook 'lisp-mode-hook 'disable-tabs)
(add-hook 'emacs-lisp-mode-hook 'disable-tabs)

(setq-default python-indent-offset custom-tab-width) ;; Python
(setq-default js-indent-level custom-tab-width) ;; Javascript

(setq-default electric-indent-inhibit t)

(setq backward-delete-char-untabify-method 'hungry)

(setq-default evil-shift-width custom-tab-width)




(provide 'init-edit)
