;; ----------------------------------------org-mode
(add-hook 'org-mode-hook (lambda()
                           ;; (org-indent-mode 1)
                           (hungry-delete-mode 1)
                           ;; 手动添加
                           ;; (toc-org-mode 1)
                           ))
;; ----------------------------------------agenda
;; 定义 agenda 文件的位置
(setq org-agenda-files '("~/notes/todos/inbox.org"))
(fset 'wusd/org-agenda
      (kmacro-lambda-form [?\M-x ?o ?r ?g ?- ?a ?g ?e ?n ?d ?a return ?o] 0 "%d"))
;; ----------------------------------------state
;; --------------------state
(setq org-todo-keywords '((sequence "TODO(t)" "DOING(g)" "BLOCKED(b)" "REVIEW(r)"
                                    "|"
                                    "DONE(d)" "CANCELED(c)")))
;; --------------------state's colour
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "yellow" :weight bold)
	            ("DOING" :foreground "spring green" :weight bold)
	            ("BLOCKED" :foreground "red" :weight bold)
	            ("DONE" :foreground "forest green" :weight bold)
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
        org-lowest-priority ?B)
;; ----------------------------------------refile
(setq org-refile-targets '(
			                     ;;修复bug,不可删除
			                     (nil :maxlevel . 1)
			                     ("~/notes/todos/inbox.org" :maxlevel . 1)
			                     ("~/notes/todos/finish.org" :maxlevel . 1)
			                     ))
;; ----------------------------------------capture
;; ("f" "TODO [Info]"
;;  entry (file+headline "~/notes/todos/inbox.org" "Info")
;;  "* TODO %i%?\n" :empty-lines 1)
(setq org-capture-templates
      '(("t" "TODO [Task]"
         entry (file+headline "~/notes/todos/inbox.org" "Task")
         "* TODO %i%?\n SCHEDULED: %t" :empty-lines 1)
        ("w" "TODO [Work]"
         entry (file+headline "~/notes/todos/inbox.org" "Work")
         "* TODO %i%?\n SCHEDULED: %t" :empty-lines 1)
        ("i" "TODO [Idea]"
         entry (file+headline "~/notes/todos/inbox.org" "Idea")
         "* TODO %i%?\n SCHEDULED: %t" :empty-lines 1)
        ("f" "TODO [info]"
         entry (file+headline "~/notes/todos/inbox.org" "Info")
         "* TODO %i%?" :empty-lines 1)
        ;; 狭义上的learn
        ("l" "TODO [learn]"
         entry (file+headline "~/notes/todos/inbox.org" "Learn")
         "* TODO %i%?\n SCHEDULED: %t" :empty-lines 1)))
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
                    (org-agenda-files '("~/notes/todos/weeks.org"))))
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

(defun tian()
  (interactive)
  (find-file "~/notes/todos/inbox.org"))
(defun zhou()
  (interactive)
  (find-file "~/notes/todos/weeks.org"))

(provide 'init-org)
