;;; init.el --- user init file  -*- no-byte-compile: t -*-
;;(add-to-list 'load-path
;;             (expand-file-name "auto-compile"
;;                               (file-name-directory load-file-name)))
(add-to-list 'load-path "~/.emacs.d/packed")
(add-to-list 'load-path "~/.emacs.d/dash.el")
(add-to-list 'load-path "~/.emacs.d/auto-compile")
(add-to-list 'load-path "~/.emacs.d/use-package")
(setq load-prefer-newer t)
(require 'auto-compile)
(auto-compile-on-load-mode 1)
(auto-compile-on-save-mode 1)

;; Emacs24 Starter Kit
;; (setenv "ORG_HOME" "/home/shared/.emacs.d/el-get/org-mode")
;; (load-file "~/.emacs.d/emacs24-starter-kit/init.el")

;; Emacs Prelude
;;(load-file "~/.emacs.d/prelude/init.el")

(require 'org-install)
(require 'ob-tangle)
;;(org-babel-load-file "~/.emacs.d/rfnash.org")

(setq x-select-enable-clipboard t)
(windmove-default-keybindings 'meta)
(setq windmove-wrap-around t)
(winner-mode 1)
(global-auto-revert-mode 1)
(require 'dired-x)
(set-face-attribute 'default nil :family "Liberation Mono for Powerline" :height 120)

(setq inhibit-splash-screen t)       ; no splash screen, thanks
(line-number-mode t)                 ; have line numbers and
(column-number-mode t)               ; column numbers in the mode line

(tool-bar-mode -1)                   ; no tool bar with icons
(scroll-bar-mode -1)                 ; no scroll bars
(menu-bar-mode -1)                   ; no menu bar

(global-hl-line-mode)                ; highlight current line


; (global-linum-mode 1)                ; add line numbers on the left


(eval-when-compile
  (require 'use-package))
;; (require 'diminish)                     ; if you use :diminish
(require 'bind-key)                     ; if you use any :bind variant

(use-package org
  :mode ("\\.org\\'" . org-mode)
  :bind (("C-c l" . org-store-link)
	 ("C-c c" . org-capture)
	 ("C-c a" . org-agenda)
	 ("C-c b" . org-iswitchb)))

(require 'org-habit)

(setq org-startup-folded t
      org-startup-indented t
      org-hide-leading-stars t
      org-log-done t
      org-log-into-drawer t
      org-return-follows-link t
      org-directory "~/Documents/OrgMode"
      org-default-notes-file (concat org-directory "/notes.org")
      org-return-follows-link t
      org-enforce-todo-dependencies t
      org-tags-exclude-from-inheritance '("project")
      org-columns-default-format "%40ITEM(Task) %TODO %3PRIORITY %TAGS %17Effort(Estimated Effort){:} %5CLOCKSUM")

(setq org-agenda-columns-add-appointments-to-effort-sum t
      org-agenda-dim-blocked-tasks t
      org-agenda-skip-deadline-if-done t
      org-agenda-skip-scheduled-if-deadline-is-shown nil
      org-agenda-skip-scheduled-if-done t
      org-agenda-span 'day
      org-agenda-sticky t
      org-agenda-window-setup 'current-window)
(setq org-sort-agenda-notime-is-late nil
      org-agenda-sorting-strategy
      '((agenda time-up habit-down timestamp-up priority-down category-keep)
	;; (agenda time-up habit-down priority-down)
	(todo priority-down category-keep)
	(tags priority-down category-keep)
	(search category-keep)))
(setq org-agenda-files
      (list org-directory
	    (concat org-directory "/backlog")
	    "~/Dropbox/notes"
	    "~/Dropbox/Projects/learning.org"))
(setq org-stuck-projects '("+project/-DONE" ("TODO" "NEXT") nil ""))
(setq org-agenda-custom-commands
      '(("n" "Agenda and all NEXT actions"
	 ((agenda "")
	  (todo "NEXT" nil))
	 ((org-agenda-regexp-filter-preset '("-SOMEDAY" "-TOODLDO"))))
	("d" "Upcoming deadlines"
	 agenda ""
	 ((org-agenda-time-grid nil)
	  (org-deadline-warning-days 36500)
	  (org-agenda-entry-types '(:deadline))))
	("v" "Videos to watch"
	 tags "CATEGORY=\"ToWatch\"" nil)
	;; TODO: consider only including those not under the appropriate level 1 heading
	("f" "Bookmarks to file"
	 ((todo "FILE")))
	("u" "Upcoming next tasks"
	 tags-todo "NEXT" nil)
	("p" "Next actions of my projects"
	 tags-todo "project" nil)
	("i" "Ideas"
	 ((todo "IDEA")))
	("r" . "Review Toodledo Tasks")
	("rt" "Review Toodledo Active tasks"
	 ((todo "TOODLDO"))
	 ((org-agenda-files '("~/Documents/OrgMode/Toodledo.org"))))
	("rs" "Review Toodledo Someday tasks"
	 ((todo "SOMEDAY"))
	 ((org-agenda-files '("~/Documents/OrgMode/Toodledo.org"))))
	))
(setq org-agenda-time-grid
      '((daily today require-timed)
	#("----------------" 0 16
	  (org-heading t))
	(800 1000 1200 1400 1600 1800 2000)))
(defvar-local rfnash-hide-blocked-tasks nil "If non-nil, hide blocked tasks, else dim them.")
(defun org-agenda-toggle-blocked-tasks ()
  "Toggle dimming/hiding blocked tasks."
  (interactive)
  (if rfnash-hide-blocked-tasks
      (progn (setq-local rfnash-hide-blocked-tasks nil)
	     (org-agenda-dim-blocked-tasks))
    (progn (setq-local rfnash-hide-blocked-tasks t)
	   (org-agenda-dim-blocked-tasks t))))

        ;;; org-agenda-redo resets the value of rfnash-hide-blocked-tasks,
        ;;; thus its value has to be saved before its called, and restored afterwards
(defun rfnash-org-agenda-redo (&optional all)
  "Rebuild possibly ALL agenda view(s) in the current buffer, hiding blocked tasks"
  (interactive "P")
  (let ((old-rfnash-hide-blocked-tasks rfnash-hide-blocked-tasks))
    (org-agenda-redo all)
    (setq-local rfnash-hide-blocked-tasks old-rfnash-hide-blocked-tasks)
    (if rfnash-hide-blocked-tasks
	(org-agenda-dim-blocked-tasks t))))
