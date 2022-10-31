;; ------------------------------------------------------------evil
;; 清空evil insert模式的map,使用默认
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state)
;; ------------------------------------------------------------input
(define-key rime-active-mode-map (kbd "<tab>") 'rime-inline-ascii)
(define-key rime-mode-map (kbd "C-`") 'rime-send-keybinding)
(define-key global-map (kbd "s-<menu>") 'toggle-input-method)
(define-key rime-mode-map (kbd "M-j") 'rime-force-enable)
;; ------------------------------------------------------------better-defaults
;; ----------------------------------------系统级按键
;; 先sharpKey改Capslock键, 把Capslock改为C-g键
;; 用autohotkey直接替换替换
;; (define-key key-translation-map (kbd "<f6>") (kbd "C-g"))
;; (define-key global-map (kbd "<f6>") 'minibuffer-keyboard-quit)
;; 改键<menu>为modifier
(define-key global-map (kbd "<menu>") nil)
(define-key key-translation-map (kbd "<menu>") 'event-apply-super-modifier)
;; --------------------Naivagate
(define-key global-map (kbd "C-f") 'scroll-up-command)
(define-key global-map (kbd "C-b") 'scroll-down-command)
;; ----------------------------------------Command
(define-key global-map (kbd "<f5>") 'wusd/eval-last-sexp)
;; ------------------------------------------------------------files
(spacemacs/set-leader-keys
  "d" 'dired-jump)
(define-key global-map (kbd "s-w") 'other-window)
;; ------------------------------------------------------------edit
;; --------------------bookmarks
(define-key global-map (kbd "<f11>") 'wusd/ivy-push-view)
(define-key global-map (kbd "<f12>") 'ivy-switch-view)
(define-key global-map (kbd "s-b") 'counsel-bookmark)
;; --------------------CUDA
;;对应Windows上面的Ctrl-a 全选
(define-key global-map (kbd "s-a") 'mark-whole-buffer)
;;对应Windows上面的Ctrl-c 复制
(define-key global-map (kbd "s-c") 'kill-ring-save)
;; 对应Windows上面的Ctrl-s 保存
;; (define-key global-map (kbd "s-s") 'save-buffer)
;;对应Windows上面的Ctrl-v 粘贴
(define-key global-map (kbd "s-v") 'yank)
;;对应Windows上面的Ctrl-z 撤销
(define-key global-map (kbd "s-z") 'undo)
;;对应Windows上面的Ctrl-x 剪切
(define-key global-map (kbd "s-x") 'kill-region)
;; ----------------------------------------Search and Replace
(define-key global-map (kbd "C-s") 'swiper)
(define-key global-map (kbd "s-s") 'query-replace)
;; ----------------------------------------Jump
(spacemacs/set-leader-keys
  "tab" 'other-window)
(define-key global-map (kbd "s-w") 'other-window)
(define-key global-map (kbd "s-j") 'evil-avy-goto-line)
(define-key global-map (kbd "s-k") 'evil-avy-goto-char-timer)
(define-key global-map (kbd "C-M-<left>") 'better-jumper-jump-backward)
(define-key global-map (kbd "C-M-<right>") 'better-jumper-jump-forward)
;; ------------------------------------------------------------code
(define-key key-translation-map (kbd "C-/") 'comment-line)
;; ------------------------------------------------------------translate
(define-key global-map (kbd "<f8>") 'youdao-dictionary-search-at-point+)
(define-key global-map (kbd "<f9>") 'youdao-dictionary-search-at-point)
(define-key global-map (kbd "<f10>") 'wusd/complete-pronounce)
;; ------------------------------------------------------------org
(define-key global-map (kbd "s-o") 'wusd/org-agenda)
(define-key global-map (kbd "s-i") 'org-capture)
;; ------------------------------------------------------------scheme
;; ------------------------------------------------------------git
(define-key global-map (kbd "s-g") 'wusd/git-pull)

(provide 'init-keymaps)
