;; ----------------------------------------org-mode
(add-hook 'org-mode-hook (lambda()
                           ;; (org-indent-mode 1)
                           (hungry-delete-mode 1)
                           ;; 手动添加
                           ;; (toc-org-mode 1)
                           ))
;; ----------------------------------------agenda
;; 定义 agenda 文件的位置
(setq org-agenda-files '("/mnt/webdav/org/inbox.org"))
(setq org-agenda-window-setup 'only-window)

;; ----------------------------------------state
;; --------------------state
;; ! : 切换到该状态时会自动添加时间戳
;; @ : 切换到该状态时要求输入文字说明
;; 如果同时设定@和!,使用@/!
(setq org-todo-keywords '((sequence "TODO(t)" "DOING(g)" "WAITING(w)" "|" "DONE(d!)" "CANCELED(c@/!)")))
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "yellow" :weight bold)
              ("DOING" :foreground "orange" :weight bold)
	            ("WAITING" :foreground "green" :weight bold)
	            ("DONE" :foreground "forest green" :weight bold)
	            ("CANCELED" :foreground "grey" :weight bold)
	            )))
;; --------------------summary
;; 大项目state的hook
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
;; --------------------clock
;; If task state is turned into done, it will  insert "Closed [timestamp]".
(setq org-log-done 'time)
;; Change task state to DOING when clocking in
(setq org-clock-in-switch-to-state "DOING")
;; Change task state to STARTED when clocking in
(setq org-clock-out-switch-to-state "DONE")
;; --------------------tags
(setq org-tag-alist '(("@task" . ?t)
		                  ("@work" . ?w)
		                  ("@idea" . ?i)
		                  ("@info" . ?f)
		                  ("@learn" . ?l)
		                  ("@prepare" . ?p)
                      ("TOC" . ?c)
		                  ))
;; --------------------properties
(setq   org-highest-priority ?A
        org-default-priority ?B
        org-lowest-priority ?C)
;; ----------------------------------------refile
(setq org-refile-targets '(
			                     ;;修复bug,不可删除
			                     (nil :maxlevel . 1)
			                     ("/mnt/webdav/finish.org" :maxlevel . 1)
			                     ("/mnt/webdav/org/inbox.org" :maxlevel . 1)
			                     ))
;; ----------------------------------------capture
(setq org-capture-templates
      '(
        ("c" "TODO"
         entry (file "/mnt/webdav/org/inbox.org")
         "* TODO %i%?\n SCHEDULED: %t" :empty-lines 0)
        ))
;; ----------------------------------------template
(fset '<s
      (kmacro-lambda-form [?\C-a ?# ?+ ?B ?E ?I backspace ?G ?I ?N ?_ ?S ?R ?C return ?# ?+ ?E ?N ?D ?_ ?S ?R ?C ?\C-p ?\C-e ? ] 0 "%d"))

;; ----------------------------------------org-agenda-custom-commands

(setq org-agenda-custom-commands
      ;; --------------------
      '(("o" "Wusd Personal Agenda"
         ((tags-todo "+PRIORITY=\"A\"")
          ;; 按优先级排序
          (agenda "" ((org-agenda-span 1)
                      (org-deadline-warning-days 0)
                      (org-agenda-sorting-strategy '(priority-down time-up))))
          (agenda "" ((org-agenda-span 7)
                      (org-deadline-warning-days 0)
                      (org-agenda-sorting-strategy '(priority-down time-up))))
          )
        )))

(fset 'wusd/org-agenda
      (kmacro-lambda-form [?\M-m ?a ?o ?o ?o] 0 "%d"))
(fset 'wusd/org-capture
      (kmacro-lambda-form [?\M-m ?a ?o ?c ?c] 0 "%d"))
(defun inbox()
  (interactive)
  (find-file "/mnt/webdav/org/inbox.org"))


(provide 'init-org)
