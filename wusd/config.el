;; 配置文件，加载顺序：第4

(add-subdirs-to-load-path "~/.spacemacs.d/wusd/config/")
;; --------------------------------------------------------------------------------

;; ------------------------------------------------------------input
;; 输入法显示框
(setq rime-show-candidate 'posframe)
(setq default-input-method "rime")
;; ------------------------------------------------------------better-defaults
;; ----------------------------------------Display
(set-frame-position (selected-frame) 800 100)
(set-frame-width (selected-frame) 110)
(set-frame-height (selected-frame) 50)
;; ------------------------------------------------------------file
;; 关闭生成init.el~文件
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
;; ------------------------------------------------------------edit
;; ----------------------------------------Abbreviation
(setq-default abbrev-mode t)
(read-abbrev-file "~/.spacemacs.d/abbrev_defs")
;; ------------------------------------------------------------project
;; 忽略文件夹
(setq projectile-globally-ignored-directories '("~/.spacemacs.d/local/"))
;; ------------------------------------------------------------org
(require 'init-org)
;; ------------------------------------------------------------translate
;; 缓存翻译
(setq url-automatic-caching t)
;; ------------------------------------------------------------scheme
(setq scheme-program-name "/usr/local/bin/mit-scheme --stack 10000")

