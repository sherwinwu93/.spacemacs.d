;; --------------------------------------------------------------------------------按键设置
;; key-translation-map: 按键替换map
;; spacemacs-default-map-root-map: 默认按键
;; spacemacs-org-mode-map-root-map: mode之后的按键
;; org-mode-map
;; (define-key my-mode-map (kbd "s-a") 'mark-whole-buffer)

;; (spacemacs/declare-prefix "o" "own-menu")
;; (spacemacs/set-leader-keys "we" 'split-window-right-and-focus)

;; (spacemacs/declare-prefix-for-mode 'org-mode "m" "menu")
;; (spacemacs/set-leader-keys-for-minor-mode 'org-mode
;;  "a" 'org-capte-kill)

;; (add-hook 'evil-visual-state-entry-hook
;;           (lambda()
;;             (define-key evil-visual-state-local-map (kbd "S") 'evil-surround-region)))

;; --------------------------------------------------------------------------------发现按键
;; SPC ?: Describe-keybindings
;; SPC h: help-prefix
;; SPC h SPC: help-layer
;; SPC h d: help-describe-prfiex

;; ------------------------------------------------------------better-defaults
;; ----------------------------------------系统级按键
;; 用autohotkey直接替换替换,把Capslock改为C-g键
;; 改键<menu>为modifier
;;(define-key my-mode-map (kbd "<menu>") nil)
(define-key key-translation-map (kbd "<menu>") 'event-apply-super-modifier)
;; (keyboard-translate ?\C-i ?\M-o)
;; ----------------------------------------evil
;; 复原evil-surround修改的按键
(add-hook 'evil-visual-state-entry-hook
          (lambda()
            (define-key evil-visual-state-local-map (kbd "S") 'evil-surround-region)
            (define-key evil-visual-state-local-map (kbd "s") 'evil-substitute)))
(define-key evil-normal-state-map (kbd "Y") 'evil-visual-block)
;; ----------------------------------------input
(define-key rime-active-mode-map (kbd "<tab>") 'rime-inline-ascii)
(define-key rime-mode-map (kbd "C-`") 'rime-send-keybinding)
;; (define-key rime-mode-map (kbd "M-j") 'rime-force-enable)

;; ------------------------------------------------------------Files
(spacemacs/set-leader-keys "d" 'dired-jump)

;; ------------------------------------------------------------edit
;; --------------------CUXA
;; --------------------CUXA
;;全选
(define-key my-mode-map (kbd "s-a") 'mark-whole-buffer)
;;复制
(define-key my-mode-map (kbd "s-c") 'kill-ring-save)
;;粘贴
(define-key my-mode-map (kbd "s-v") 'yank)
(define-key my-mode-map (kbd "M-v") 'counsel-yank-pop)
;;撤销
(define-key my-mode-map (kbd "s-z") 'undo)
(define-key my-mode-map (kbd "M-z") 'undo-tree-visualize)
;;剪切
(define-key my-mode-map (kbd "s-x") 'kill-region)
;; ----------------------------------------Search and Replace
(define-key my-mode-map (kbd "s-f") 'swiper)
;; (define-key my-mode-map (kbd "C-s") 'helm-swoop)
;; (define-key my-mode-map (kbd "M-s") 'spacemacs/search-project-auto)
(define-key my-mode-map (kbd "C-S-f") 'spacemacs/search-project-auto)
;; (define-key my-mode-map (kbd "C-S-s") 'spacemacs/helm-project-smart-do-search)
(define-key my-mode-map (kbd "s-r") 'query-replace)
(define-key my-mode-map (kbd "C-S-r") 'projectile-replace)
;; (define-key my-mode-map (kbd "M-q") 'projectile-replace)

;; ------------------------------------------------------------Window buffer or tab
;; ----------------------------------------navigation
;; have defined in *.ahk
(define-key my-mode-map (kbd "C-f") 'evil-scroll-page-down)
(define-key my-mode-map (kbd "C-b") 'evil-scroll-page-up)
(define-key my-mode-map (kbd "C-a") 'mwim-beginning-of-code-or-line)
(define-key my-mode-map (kbd "C-e") 'mwim-end-of-line-or-code)

;; ----------------------------------------buffer or tab
(keyboard-translate ?\C-i ?\s-0)
(define-key my-mode-map (kbd "C-M-<left>") 'better-jumper-jump-backward)
(define-key my-mode-map (kbd "C-M-<right>") 'better-jumper-jump-forward)
(define-key my-mode-map (kbd "s-0") 'better-jumper-jump-forward)

;; ----------------------------------------window
(spacemacs/set-leader-keys "<tab>" 'other-window)
(spacemacs/set-leader-keys
  "we" 'split-window-right-and-focus
  "ws" 'split-window-below-and-focus)
(define-key my-mode-map (kbd "s-w") 'delete-window)
(define-key my-mode-map (kbd "s-j") 'scroll-other-window)
(define-key my-mode-map (kbd "s-k") 'scroll-other-window-down)

;; ------------------------------------------------------------Project
(define-key my-mode-map (kbd "s-1") 'spacemacs/treemacs-project-toggle)
(define-key my-mode-map (kbd "s-2") 'treemacs-add-and-display-current-project-exclusively)

;; ------------------------------------------------------------code
(define-key key-translation-map (kbd "C-/") 'comment-line)
(define-key my-mode-map (kbd "C-M-l") 'indent-whole)

;; ------------------------------------------------------------translate
(define-key my-mode-map (kbd "<f7>") 'youdao-dictionary-search-at-point)
(define-key my-mode-map (kbd "<f8>") 'youdao-dictionary-search-at-point+)
(define-key my-mode-map (kbd "s-t") 'wusd/add-pronunciation)

;; ------------------------------------------------------------org
(define-key my-mode-map (kbd "s-o") 'wusd/org-agenda)
(define-key my-mode-map (kbd "s-i") 'org-capture)
(define-key spacemacs-org-mode-map-root-map (kbd "M-<return>") 'org-meta-return)

;; ------------------------------------------------------------Commands
;; ----------------------------------------Macros
(define-key my-mode-map (kbd "<f5>") 'kmacro-name-last-macro)
(define-key my-mode-map (kbd "<f6>") 'insert-kbd-macro)
;; ----------------------------------------Eval
(define-key my-mode-map (kbd "s-3") 'eval-last-sexp)
(define-key my-mode-map (kbd "s-4") 'wusd/eval-last-sexp)


;; ------------------------------------------------------------help
(define-key my-mode-map (kbd "<f9>") (lookup-key global-map (kbd "C-h")))
(define-key my-mode-map (kbd "<f10>") 'describe-function)
(define-key my-mode-map (kbd "<f11>") 'describe-mode)
(define-key my-mode-map (kbd "<f12>") 'describe-key)


(provide 'init-keymaps)
