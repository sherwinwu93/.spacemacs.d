;; --------------------Display
(set-frame-position (selected-frame) 800 100)
(set-frame-width (selected-frame) 110)
(set-frame-height (selected-frame) 50)

;; --------------------fonts
(dolist (charset '(kana han cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font) charset
                    (font-spec :family "Consolas"
                               :size 9.5)))


(provide 'init-better-defaults)
