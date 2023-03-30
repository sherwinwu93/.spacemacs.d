;; 查询时区分大小写
(setq-default case-fold-search nil)
;; ----------------------------------------fonts
;; 设置行间距
(defun set-bigger-spacing ()
  (setq-local default-text-properties '(line-spacing 0.2 line-height 1.2)))
(add-hook 'text-mode-hook 'set-bigger-spacing)
(add-hook 'prog-mode-hook 'set-bigger-spacing)
;; 设置折行
(add-hook 'org-mode-hook (lambda()
                           (setq truncate-lines nil)))
;; ----------------------------------------Abbreviation
;; unexpand-abbrev| 退回缩写
;; list-abbrevs wushengdong
(setq-default abbrev-mode t)
(setq abbrev-file-name "~/.spacemacs.d/abbrev_defs")
;; 设置退出时询问保存缩写
;; (setq save-abbrevs t)
;; ----------------------------------------bookmarks
(setq-default bookmark-default-file "~/.spacemacs.d/bookmarks")
(fset 'wusd/ivy-push-view
      (kmacro-lambda-form [?\M-x ?i ?v ?y ?- ?p ?u ?s ?h ?- ?v ?i ?e ?w return return] 0 "%d"))
(fset 'wusd/ivy-pop-view
      (kmacro-lambda-form [?\M-x ?i ?v ?y ?- ?p ?o ?p ?- ?v ?i ?e ?w return return] 0 "%d"))
;; ----------------------------------------tab
;; 用制表符代替空格
(setq custom-tab-width 2)
;; Two callable functions for enabling/disabling tabs in Emacs
(defun disable-tabs () (setq indent-tabs-mode nil))
(defun enable-tabs ()
	(define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)
	(setq indent-tabs-mode t)
	(setq tab-width custom-tab-width))
(add-hook 'prog-mode-hook 'enable-tabs)
(add-hook 'text-mode-hook 'enable-tabs)
(add-hook 'lisp-mode-hook 'disable-tabs)
(add-hook 'emacs-lisp-mode-hook 'disable-tabs)
(add-hook 'web-mode-hook (lambda()
                           (my-setup-indent 2)))
(setq-default python-indent-offset custom-tab-width) ;; Python
(setq-default js-indent-level custom-tab-width) ;; Javascript
(setq-default electric-indent-inhibit t)
(setq backward-delete-char-untabify-method 'hungry)
(setq-default evil-shift-width custom-tab-width)
;; ----------------------------------------缩进
(defun indent-whole()
  (interactive)
  (indent-region (point-min) (point-max))
  (message "format successfully"))

(provide 'init-edit)
