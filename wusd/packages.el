;; 加载包: 加载顺序: 第2
;;(require 'init-packages)
;;(require 'init-evil)
;;(require 'init-input)
;;;; ---------------------------------
;;(require 'init-better-defaults)
;;(require 'init-files)
;;(require 'init-tabs)
;;(require 'init-edit)
;;;;(require 'init-tab)
;;(require 'init-project)
;;;; ---------------------------------
;;(require 'init-code)
;;(require 'init-kbd-macros)
;;(require 'init-org)
;;(require 'init-shell)
;;;; ---------------------------------
;;(require 'init-translate)
;;(require 'init-vc)
;;(require 'init-scheme)
;;;; ---------------------------------
;;(require 'init-key-maps)
(defconst wusd-packages
  '(
    rime
    (xscheme :location local)
    (auto-save :location local)
    youdao-dictionary
    ))
(defun wusd/init-rime()
  (use-package rime))
(defun wusd/init-xscheme()
  (use-package xscheme))
(defun wusd/init-auto-save()
    (use-package auto-save
	         :config (auto-save-enable)
))
(defun wusd/init-youdao-dictionary()
  (use-package youdao-dictionary))
