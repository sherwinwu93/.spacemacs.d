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
;; 用autohotkey直接替换替换,把Capslock改为C-g键
;; 改键<menu>为modifier
(define-key global-map (kbd "<menu>") nil)
(define-key key-translation-map (kbd "<menu>") 'event-apply-super-modifier)
;; 复原evil-surround修改的按键
(add-hook 'evil-visual-state-entry-hook
          (lambda()
            (define-key evil-visual-state-local-map (kbd "S") 'evil-surround-region)
            (define-key evil-visual-state-local-map (kbd "s") 'evil-substitute)
            ))

;; ----------------------------------------Command
(define-key global-map (kbd "<f5>") 'wusd/eval-last-sexp)
;; ------------------------------------------------------------edit
;; --------------------CUDA
;;对应Windows上面的Ctrl-a 全选
(define-key global-map (kbd "M-a") 'mark-whole-buffer)
;;对应Windows上面的Ctrl-c 复制
(define-key global-map (kbd "M-c") 'kill-ring-save)
;;对应Windows上面的Ctrl-v 粘贴
(define-key global-map (kbd "M-v") 'yank)
;;对应Windows上面的Ctrl-z 撤销
(define-key global-map (kbd "M-z") 'undo)
;;对应Windows上面的Ctrl-x 剪切
(define-key global-map (kbd "M-x") 'kill-region)
;; ----------------------------------------Search and Replace
(define-key global-map (kbd "C-s") 'swiper)
(define-key global-map (kbd "C-S") 'spacemacs/search-project-auto)
(define-key global-map (kbd "s-s") 'query-replace)
;; ----------------------------------------Navigation
(spacemacs/set-leader-keys
  "d" 'dired-jump
  "<tab>" 'other-window)
(define-key global-map (kbd "s-w") 'spacemacs/window-transient-state/spacemacs/shrink-window-horizontally)
(define-key global-map (kbd "s-b") 'wusd/quick-buffer)
(define-key global-map (kbd "s-h") 'scroll-other-window-down)
(define-key global-map (kbd "s-l") 'scroll-other-window)
(define-key global-map (kbd "s-j") 'avy-goto-line)
(define-key global-map (kbd "s-k") 'avy-goto-char-timer)
(define-key global-map (kbd "C-M-<left>") 'better-jumper-jump-backward)
(define-key global-map (kbd "C-M-<right>") 'better-jumper-jump-forward)
;; ------------------------------------------------------------code
(define-key key-translation-map (kbd "C-/") 'comment-line)
(define-key global-map (kbd "C-M-l") 'indent-whole)
;; ------------------------------------------------------------translate
(define-key global-map (kbd "<f8>") 'youdao-dictionary-search-at-point+)
(define-key global-map (kbd "<f9>") 'youdao-dictionary-search-at-point)
(define-key global-map (kbd "<f10>") 'wusd/complete-pronounce)
;; ------------------------------------------------------------org
(define-key global-map (kbd "s-o") 'wusd/org-agenda)
(define-key global-map (kbd "s-i") 'org-capture)
;; ------------------------------------------------------------scheme
(spacemacs/set-leader-keys
  "o" 'org-agenda)
;; ------------------------------------------------------------git
(define-key global-map (kbd "s-g") 'wusd/git-pull)

;; ------------------------------------------------------------help
(define-key global-map (kbd "s-x") 'counsel-M-x)
(define-key global-map (kbd "<f11>") 'describe-function)
(define-key global-map (kbd "<f12>") 'describe-key)


(provide 'init-keymaps)
