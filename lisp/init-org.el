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

;; ----------------------------------------state
;; --------------------state
(setq org-todo-keywords '((sequence "TODO(t)" "DOING(g)" "|" "DONE(d)")
                          (sequence "REPORT(r)" "BUG(b)" "|" "FIXED(f)")
                          (sequence "WAITING(w)" "|" "CANCELED(c)")
                          ))
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "yellow" :weight bold)
              ("REPORT" :foreground "yellow" :weight bold)
	            ("DONE" :foreground "forest green" :weight bold)
	            ("FIXED" :foreground "forest green" :weight bold)
	            ("CANCELED" :foreground "forest green" :weight bold)
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
        ("i" "TODO"
         entry (file "/mnt/webdav/org/inbox.org")
         "* TODO %i%?\n SCHEDULED: %t\n" :empty-lines 1)
        ;; ("s" "TODO [Study]"
        ;;  entry (file+headline "/mnt/webdav/org/inbox.org" "Study")
        ;;  "* TODO %i%?\n SCHEDULED: %t" :empty-lines 1)
        ))
;; ----------------------------------------template
(fset '<s
      (kmacro-lambda-form [?\C-a ?# ?+ ?B ?E ?I backspace ?G ?I ?N ?_ ?S ?R ?C return ?# ?+ ?E ?N ?D ?_ ?S ?R ?C ?\C-p ?\C-e ? ] 0 "%d"))

;; ----------------------------------------org-agenda-custom-commands

(setq org-agenda-window-setup 'only-window)

(setq org-agenda-custom-commands
      ;; --------------------
      '(("o" "Wusd Personal Agenda"
         ((tags-todo "+PRIORITY=\"A\"")
          ;; 按优先级排序
          (agenda "" ((org-agenda-span 1)
                      (org-deadline-warning-days 0)
                      (org-agenda-sorting-strategy '(priority-down time-up))))
          ;; 空的周课表,需要准备则todo
          (agenda "" ((org-agenda-span 7)
                      (org-agenda-files '("/mnt/webdav/org/weeks.org"))))
          ;; 生日
          (agenda "" ((org-agenda-entry-types '(:deadline))
                      (org-agenda-span 1)
                      (org-deadline-warning-days 7)
                      (org-agenda-time-grid nil)))
			    ;; (tags "@logic")
          ;; (todo "TODO")
          ;; (todo "CANCELED")
          ;; (todo "DONE")
          ))
        ;; --------------------
        ("w" "Weekly Review" ((agenda "" ((org-agenda-span 7)))
			                        (stuck "")
			                        (todo "TODO")
			                        (todo "DOING")
			                        (todo "DONE")))
        ;; --------------------
        ("g" . "GTD contexts")
        ("gt" "task" tags-todo "@task")
        ("gw" "work" tags-todo "@work")
        ("gi" "idea" tags-todo "@idea")
        ("gf" "info" tags-todo "@info")
        ("gl" "learn" tags-todo "@learn")
        ("G" "GTD Block Agenda"
         ((tags-todo "@task")
          (tags-todo "@work")
          (tags-todo "@idea")
          (tags-todo "@info")
          (tags-todo "@learn")))))

(fset 'wusd/org-agenda
      (kmacro-lambda-form [?\M-m ?a ?o ?o ?o] 0 "%d"))
(fset 'wusd/org-capture
      (kmacro-lambda-form [?\M-m ?a ?o ?c ?i] 0 "%d"))

(defun tian()
  (interactive)
  (find-file "/mnt/webdav/org/inbox.org"))
(defun zhou()
  (interactive)
  (find-file "/mnt/webdav/org/weeks.org"))


(provide 'init-org)
