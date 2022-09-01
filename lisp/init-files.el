;; 关闭生成init.el~文件
(use-package auto-save
  :load-path "~/.spacemacs.d/lisp/extensions/"
	:config (auto-save-enable))
;; 关闭备份文件
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq auto-save-silent t)
(setq auto-save-disable-predicates
	    '((lambda ()
	        (string-suffix-p
	         "gpg"
	         (file-name-extension (buffer-name)) t))))
;; 自动同步硬盘文件
(global-auto-revert-mode 1)
;; 关闭文件滑动控件
(scroll-bar-mode -1)

(provide 'init-files)
