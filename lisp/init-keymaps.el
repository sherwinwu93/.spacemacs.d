;; ------------------------------------------------------------better-defaults
;; ----------------------------------------系统级按键
;; 用autohotkey直接替换替换,把Capslock改为C-g键
;; 改键<menu>为modifier
(define-key my-mode-map (kbd "<menu>") nil)
(define-key key-translation-map (kbd "<menu>") 'event-apply-super-modifier)
;; 复原evil-surround修改的按键
(add-hook 'evil-visual-state-entry-hook
          (lambda()
            (define-key evil-visual-state-local-map (kbd "S") 'evil-surround-region)
            (define-key evil-visual-state-local-map (kbd "s") 'evil-substitute)))
;; ----------------------------------------evil
;; 清空evil insert模式的map,使用默认
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state)
(define-key evil-normal-state-map (kbd "Y") 'evil-visual-block)
;; ----------------------------------------input
(define-key rime-active-mode-map (kbd "<tab>") 'rime-inline-ascii)
(define-key rime-mode-map (kbd "C-`") 'rime-send-keybinding)
;; (define-key rime-mode-map (kbd "M-j") 'rime-force-enable)

;; ------------------------------------------------------------Files
(spacemacs/set-leader-keys "d" 'dired-jump)
(define-key my-mode-map (kbd "C-d") 'dired-jump)

;; ------------------------------------------------------------edit
;; --------------------CUDA
;;对应Windows上面的Ctrl-a 全选
(define-key my-mode-map (kbd "C-a") 'mark-whole-buffer)
;;对应Windows上面的Ctrl-c 复制
(define-key my-mode-map (kbd "C-c") 'kill-ring-save)
;;对应Windows上面的Ctrl-v 粘贴
(define-key my-mode-map (kbd "C-v") 'yank)
(define-key my-mode-map (kbd "M-v") 'yank-pop)
;;对应Windows上面的Ctrl-z 撤销
(define-key my-mode-map (kbd "C-z") 'undo)
(define-key my-mode-map (kbd "M-z") 'undo-tree-visualize)
;;对应Windows上面的Ctrl-x 剪切
(define-key my-mode-map (kbd "C-x") 'kill-region)
;; ----------------------------------------Search and Replace
(define-key my-mode-map (kbd "C-s") 'swiper)
;; (define-key my-mode-map (kbd "C-s") 'helm-swoop)
(define-key my-mode-map (kbd "C-S-s") 'spacemacs/search-project-auto)
;; (define-key my-mode-map (kbd "C-S-s") 'spacemacs/helm-project-smart-do-search)
(define-key my-mode-map (kbd "M-s") 'query-replace)
(define-key my-mode-map (kbd "C-S-r") 'projectile-replace)

;; ------------------------------------------------------------Buffer and Window
;; ----------------------------------------buffer
(define-key my-mode-map (kbd "M-b") 'ivy-switch-buffer)
(define-key my-mode-map (kbd "C-M-<left>") 'better-jumper-jump-backward)
(define-key my-mode-map (kbd "C-M-<right>") 'better-jumper-jump-forward)
;; ----------------------------------------window
(define-key my-mode-map (kbd "M-d") 'spacemacs/delete-window)
(define-key my-mode-map (kbd "M-w") 'other-window)
(define-key my-mode-map (kbd "C-M-j") 'scroll-other-window)
(define-key my-mode-map (kbd "C-M-k") 'scroll-other-window-down)
(define-key my-mode-map (kbd "C-j") 'avy-goto-line)
(define-key my-mode-map (kbd "C-k") 'avy-goto-char-timer)

;; ------------------------------------------------------------code
(define-key key-translation-map (kbd "C-/") 'comment-line)
(define-key my-mode-map (kbd "C-M-l") 'indent-whole)

;; ------------------------------------------------------------translate
(define-key my-mode-map (kbd "<f7>") 'youdao-dictionary-search-at-point)
(define-key my-mode-map (kbd "<f8>") 'youdao-dictionary-search-at-point+)
(define-key my-mode-map (kbd "M-t") 'wusd/add-pronunciation)

;; ------------------------------------------------------------org
(define-key my-mode-map (kbd "M-o") 'wusd/org-agenda)
(define-key my-mode-map (kbd "M-i") 'org-capture)

;; ------------------------------------------------------------Commands
;; ----------------------------------------Macros
(define-key my-mode-map (kbd "<f5>") 'kmacro-name-last-macro)
(define-key my-mode-map (kbd "<f6>") 'insert-kbd-macro)
;; ----------------------------------------Eval
(define-key my-mode-map (kbd "M-e") 'eval-last-sexp)

;; ------------------------------------------------------------help
(define-key my-mode-map (kbd "<f9>") 'wusd/eval-last-sexp)
(define-key my-mode-map (kbd "<f10>") 'describe-variable)
(define-key my-mode-map (kbd "<f11>") 'describe-function)
(define-key my-mode-map (kbd "<f12>") 'describe-key)


(provide 'init-keymaps)
