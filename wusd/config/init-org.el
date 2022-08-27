;; 定义 agenda 文件的位置
(setq org-agenda-files '("~/notes/todos/inbox.org"))
;; 大项目state的hook
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

(setq org-todo-keywords
      '((sequence "TODO(t)"
		  "DOING(g)"
		  "WAITING(b)"
		  "REVIEW(r)"
		  "|"
		  "DONE(d)"
		  )
	))
;; state的颜色
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
	      ("DONE" :foreground "forest green" :weight bold)
	      ("DOING" :foreground "yellow" :weight bold)
	      ("BLOCKED" :foreground "red" :weight bold)
	      ("REVIEW" :foreground "orange" :weight bold)
	      )))

;; If task state is turned into done, it will  insert "Closed [timestamp]".
(setq org-log-done 'time)

;; Change task state to DOING when clocking in
(setq org-clock-in-switch-to-state "DOING")
;; Change task state to STARTED when clocking in
(setq org-clock-out-switch-to-state "DONE")

;; fast tags
(setq org-tag-alist '(("@work" . ?w)
		      ("@home" . ?h)
		      ("@buy" . ?b)
		      ("@bossurgent" . ?o)
		      ("@ungroup" . ?u)
		      ("@study" . ?s)))

(setq org-refile-targets '(
			   ;;修复bug,不可删除
			   (nil :maxlevel . 1)
			   ("~/notes/todos/inbox.org" :maxlevel . 1)
			   ))
(defun agenda-file()
  (interactive)
  (find-file "~/notes/todos/inbox.org"))

;; ----------------------------------------capture
(setq org-capture-templates '(("c" "Todo [inbox]" entry
			       (file+headline "~/notes/todos/inbox.org" "Tasks")
			       "* TODO %i%?")
			      ("l" "Todo [NCE2]" entry
			       (file+headline "~/notes/todos/inbox.org" "NCE2")
			       "* TODO %i%?")
			      ))

(require 'init-org-agenda-custom-commands)

(provide 'init-org)
