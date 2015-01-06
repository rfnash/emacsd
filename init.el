;;; init.el --- user init file  -*- no-byte-compile: t -*-
;(add-to-list 'load-path
;             (expand-file-name "auto-compile"
;                               (file-name-directory load-file-name)))
(add-to-list 'load-path "~/.emacs.d/packed")
(add-to-list 'load-path "~/.emacs.d/auto-compile")
(setq load-prefer-newer t)
(require 'auto-compile)
(auto-compile-on-load-mode 1)
(auto-compile-on-save-mode 1)

;; Emacs24 Starter Kit
;; (setenv "ORG_HOME" "/home/shared/.emacs.d/el-get/org-mode")
;; (load-file "~/.emacs.d/emacs24-starter-kit/init.el")

;; Emacs Prelude
(load-file "~/.emacs.d/prelude/init.el")
