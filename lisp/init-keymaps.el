;; ------------------------------------------------------------better-defaults
;; ----------------------------------------系统级按键
;; 用autohotkey直接替换替换,把Capslock改为C-g键
;; 改键<menu>为modifier
;;(define-key my-mode-map (kbd "<menu>") nil)
;;(define-key key-translation-map (kbd "<menu>") 'event-apply-super-modifier)
(keyboard-translate ?\C-i ?\M-o)
;; ----------------------------------------evil
;; 复原evil-surround修改的按键
(add-hook 'evil-visual-state-entry-hook
          (lambda()
            (define-key evil-visual-state-local-map (kbd "S") 'evil-surround-region)
            (define-key evil-visual-state-local-map (kbd "s") 'evil-substitute)))
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

;; ------------------------------------------------------------edit
;; --------------------CUDA
;;全选
(define-key my-mode-map (kbd "M-a") 'mark-whole-buffer)
;;复制
(define-key my-mode-map (kbd "M-c") 'kill-ring-save)
;;粘贴
(define-key my-mode-map (kbd "M-v") 'yank)
(define-key evil-insert-state-map (kbd "C-v") 'yank-pop)
;;撤销
(define-key my-mode-map (kbd "M-z") 'undo)
;;剪切
(define-key my-mode-map (kbd "M-x") 'kill-region)
;; ----------------------------------------Search and Replace
(define-key my-mode-map (kbd "M-f") 'swiper)
;; (define-key my-mode-map (kbd "C-s") 'helm-swoop)
;; (define-key my-mode-map (kbd "M-s") 'spacemacs/search-project-auto)
(define-key my-mode-map (kbd "C-S-f") 'spacemacs/search-project-auto)
;; (define-key my-mode-map (kbd "C-S-s") 'spacemacs/helm-project-smart-do-search)
(define-key my-mode-map (kbd "M-r") 'query-replace)
(define-key my-mode-map (kbd "C-S-r") 'projectile-replace)
;; (define-key my-mode-map (kbd "M-q") 'projectile-replace)

;; ------------------------------------------------------------Window buffer or tab
;; ----------------------------------------direction
;; have defined in *.ahk
(define-key key-translation-map (kbd "C-n") (kbd "<down>"))
(define-key key-translation-map (kbd "C-p") (kbd "<up>"))

(define-key my-mode-map (kbd "C-f") 'evil-scroll-page-down)
(define-key my-mode-map (kbd "C-b") 'evil-scroll-page-up)

;; ----------------------------------------buffer or tab
;; (define-key my-mode-map (kbd "M-<left>"spacemacs/tabs-backwardfer)
;; (define-key my-mode-map (kbd "M-<right>") 'forward-buffer)

(define-key my-mode-map (kbd "C-M-<left>") 'better-jumper-jump-backward)
(define-key my-mode-map (kbd "C-M-<right>") 'better-jumper-jump-forward)
;; ----------------------------------------window
(spacemacs/set-leader-keys "<tab>" 'other-window)
(spacemacs/set-leader-keys "we" 'split-window-right-and-focus)
(spacemacs/set-leader-keys "ws" 'split-window-below-and-focus)
(spacemacs/set-leader-keys "ww" 'spacemacs/toggle-maximize-buffer)
(define-key my-mode-map (kbd "C-d") 'delete-window)
(define-key my-mode-map (kbd "C-M-j") 'scroll-other-window)
(define-key my-mode-map (kbd "C-M-k") 'scroll-other-window-down)
(define-key my-mode-map (kbd "M-k") 'avy-goto-line)
(define-key my-mode-map (kbd "M-j") 'avy-goto-char-timer)

;; ------------------------------------------------------------Project
(define-key my-mode-map (kbd "M-1") 'spacemacs/treemacs-project-toggle)
(define-key my-mode-map (kbd "M-2") 'treemacs-add-and-display-current-project-exclusively)

;; ------------------------------------------------------------code
(define-key key-translation-map (kbd "C-/") 'comment-line)
(define-key my-mode-map (kbd "C-M-l") 'indent-whole)

;; ------------------------------------------------------------translate
(define-key my-mode-map (kbd "<f7>") 'youdao-dictionary-search-at-point)
(define-key my-mode-map (kbd "<f8>") 'youdao-dictionary-search-at-point+)
(define-key my-mode-map (kbd "C-t") 'youdao-dictionary-search-at-point+)
(define-key my-mode-map (kbd "M-t") 'wusd/add-pronunciation)

;; ------------------------------------------------------------org
(define-key my-mode-map (kbd "C-o") 'wusd/org-agenda)
(define-key my-mode-map (kbd "M-o") 'org-capture)
(spacemacs/set-leader-keys-for-major-mode 'org-mode
  "j" 'org-next-visible-heading
  "k" 'org-previous-visible-heading
  "h" 'org-backward-heading-same-level
  "l" 'org-forward-heading-same-level
  )
(define-key spacemacs-org-mode-map-root-map (kbd "M-<return>") 'org-meta-return)

;; ------------------------------------------------------------Commands
;; ----------------------------------------Macros
(define-key my-mode-map (kbd "<f5>") 'kmacro-name-last-macro)
(define-key my-mode-map (kbd "<f6>") 'insert-kbd-macro)
;; ----------------------------------------Eval
(define-key my-mode-map (kbd "M-e") 'wusd/eval-last-sexp)

;; ------------------------------------------------------------help
(define-key my-mode-map (kbd "<f9>") (lookup-key global-map (kbd "C-h")))
(define-key my-mode-map (kbd "<f10>") 'describe-mode)
(define-key my-mode-map (kbd "<f11>") 'describe-function)
(define-key my-mode-map (kbd "<f12>") 'describe-key)


(provide 'init-keymaps)
