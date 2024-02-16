;;; init.el --- Description -*- lexical-binding: t; -*-

;; Make M-x work correctly in Emacs-mac
(cond ((eq system-type 'darwin)
       (setq mac-option-modifier 'meta)))

(tool-bar-mode -1)             ; Hide the outdated icons
(scroll-bar-mode -1)           ; Hide the always-visible scrollbar
(setq inhibit-splash-screen t) ; Remove the "Welcome to GNU Emacs" splash screen
(setq use-file-dialog nil)      ; Ask for textual confirmation instead of GUI

;; Install straight.el

(add-to-list 'load-path "~/dotfiles/emacs/plain/elisp")

(require 'straight)
(require 'emacs)
(require 'evil)

(provide 'init)
