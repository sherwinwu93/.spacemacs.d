;; ----------------------------------------files
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

;; ----------------------------------------单个dired buffer
;; (setq dired-recursive-copies 'always)
;; (setq dired-recursive-deletes 'always)
;; (setq dired-dwim-target t)

;; (put 'dired-find-alternate-file 'disabled nil)
;; (with-eval-after-load 'dired
;;   (define-key dired-mode-map (kbd "RET") 'dired-fis dired-up-directory)
;;   (define-key dired-mode-map (kbd "^") (lambda () (interactive) (find-alternate-file ".."))))


(provide 'init-files)
