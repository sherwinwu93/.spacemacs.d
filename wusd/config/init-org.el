(add-hook 'org-mode-hook (lambda()
                           (org-indent-mode t)
                           ))


;; 定义 agenda 文件的位置
(setq org-agenda-files '("~/notes/todos/"))
;; 大项目state的hook
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

(setq org-todo-keywords
      '((sequence "TODO(t)"
		              "DOING(g)"
		              "BLOCKED(b)"
		              "|"
		              "DONE(d)"
                  "CANCELED(c)"
		              )
	      ))
;; state的颜色
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "yellow" :weight bold)
	            ("DOING" :foreground "spring green" :weight bold)
	            ("BLOCKED" :foreground "red" :weight bold)
	            ("DONE" :foreground "forest green" :weight bold)
	            ("CANCELED" :foreground "yellow" :weight bold)
	            )))

;; If task state is turned into done, it will  insert "Closed [timestamp]".
(setq org-log-done 'time)

;; Change task state to DOING when clocking in
(setq org-clock-in-switch-to-state "DOING")
;; Change task state to STARTED when clocking in
(setq org-clock-out-switch-to-state "DONE")

;; fast tags
;; (setq org-tag-alist '(("@work" . ?w)
;; 		      ("@home" . ?h)
;; 		      ("@buy" . ?b)
;; 		      ("@bossurgent" . ?o)
;; 		      ("@ungroup" . ?u)
;;          ("@study" . ?s)))
(setq org-tag-alist '(("@task" . ?t)
		                  ("@work" . ?w)
		                  ("@idea" . ?i)
		                  ("@info" . ?f)
		                  ("@learn" . ?l)
		                  ))

(setq org-refile-targets '(
			                     ;;修复bug,不可删除
			                     (nil :maxlevel . 1)
			                     ("~/notes/todos/inbox.org" :maxlevel . 1)
			                     ("~/notes/todos/finish.org" :maxlevel . 1)
			                     ))
(defun agenda-file()
  (interactive)
  (find-file "~/notes/todos/"))

;; ----------------------------------------capture
;; (setq org-capture-templates '(
;;("c" "Todo [Tasks]" entry
;; 			       (file+headline "~/notes/todos/inbox.org" "Tasks")
;; 			       "* TODO %i%?\n%T")
;; 			      ("i" "[Ideas]" entry
;; 			       (file+headline "~/notes/todos/inbox.org" "Ideas")
;; 			       "* %i%?\n")
;; 			      ("f" "Todo [Infos]" entry
;; 			       (file+headline "~/notes/todos/inbox.org" "Infos")
;; 			       "* %i%?\n")
;; )
(setq org-capture-templates
      '(
        ("t" "TODO [Task]"
         entry (file+headline "~/notes/todos/inbox.org" "Task")
         "* TODO %i%?\n%T"
         :empty-lines 1)
        ("w" "TODO [Work]"
         entry (file+headline "~/notes/todos/inbox.org" "Work")
         "* TODO %i%?\n%T"
         :empty-lines 1)
        ("i" "TODO [Idea]"
         entry (file+headline "~/notes/todos/inbox.org" "Idea")
         "* TODO %i%?\n%t"
         :empty-lines 1)
        ("f" "[Info]"
         entry (file+headline "~/notes/todos/inbox.org" "Info")
         "* %i%?\n"
         :empty-lines 1)
        ;; 狭义上的learn
        ("l" "TODO [learn]"
         entry (file+headline "~/notes/todos/inbox.org" "Learn")
         "* TODO %i%?\n%T"
         :empty-lines 1)
        ))

(require 'init-org-agenda-custom-commands)

(provide 'init-org)
