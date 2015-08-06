;;; init.el --- user init file  -*- no-byte-compile: t -*-
;;(add-to-list 'load-path
;;             (expand-file-name "auto-compile"
;;                               (file-name-directory load-file-name)))
(add-to-list 'load-path "~/.emacs.d/packed")
(add-to-list 'load-path "~/.emacs.d/dash.el")
(add-to-list 'load-path "~/.emacs.d/auto-compile")
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
(org-babel-load-file "~/.emacs.d/rfnash.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
