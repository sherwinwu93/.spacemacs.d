;; 所有快捷键: 执行顺序:第5

;; ------------------------------------------------------------input
(define-key rime-active-mode-map (kbd "<tab>") 'rime-inline-ascii)
(define-key rime-mode-map (kbd "C-`") 'rime-send-keybinding)
(define-key rime-mode-map (kbd "M-j") 'rime-force-enable)
;; ------------------------------------------------------------better-defaults
;; ----------------------------------------系统级按键
;; 先sharpKey改Capslock键, 把Capslock改为C-g键
(define-key key-translation-map (kbd "<f10>") (kbd "C-g"))
(define-key global-map (kbd "<f10>") 'keyboard-escape-quit)
(define-key key-translation-map (kbd "<f12>") (kbd "C-h"))
;; 改键<menu>为modifier
(define-key global-map (kbd "<menu>") nil)
(define-key key-translation-map (kbd "<menu>") 'event-apply-super-modifier)
;; --------------------方向
(define-key global-map (kbd "C-f") 'scroll-up-command)
(define-key global-map (kbd "C-b") 'scroll-down-command)
;; ----------------------------------------Command
(define-key global-map (kbd "<f5>") 'wusd/eval-last-sexp)
;; ------------------------------------------------------------files
(spacemacs/set-leader-keys
  "d" 'dired-jump)
;; ------------------------------------------------------------edit
;; --------------------CUDA
;;对应Windows上面的Ctrl-a 全选
(define-key global-map (kbd "s-a") 'mark-whole-buffer)
;;对应Windows上面的Ctrl-c 复制
(define-key global-map (kbd "s-c") 'kill-ring-save)
;; 对应Windows上面的Ctrl-s 保存
;; (define-key global-map (kbd "s-s") 'save-buffer)
;;对应Windows上面的Ctrl-v 粘贴
(define-key global-map (kbd "s-v") 'yank)
;;对应Windows上面的Ctrol-z 撤销
(define-key global-map (kbd "s-z") 'undo)
;;对应Windows上面的Ctrol-x 剪切
(define-key global-map (kbd "s-x") 'kill-region)
;; ------------------------------------------------------------translate
(evil-leader/set-key
  "ot" 'youdao-dictionary-search-at-point+
  "oy" 'youdao-dictionary-search-at-point
  )
;; ------------------------------------------------------------org
;; (spacemacs/set-leader-keys
;;   "ao" nil
;;   "aop" 'org-ctrl-c-ctrl-c
;;   "aot" 'org-todo
;;   "aod" 'org-deadline
;;   "aos" 'org-schedule
;;   "aoa" 'org-agenda
;;   "aoc" 'org-capture
;;   "aor" 'org-refile
;;   )
;; (spacemacs/declare-prefix
;;   "ao" "org")

;; ------------------------------------------------------------scheme
(define-key global-map (kbd "<f9>") 'wusd/open-mit-scheme)