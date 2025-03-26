;;; init.el --- Description -*- lexical-binding: t; -*-

;;; Code:
;; Package setup
(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq package-selected-packages '(evil general ivy projectile))

(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)

(setq initial-scratch-message nil)
(setq scroll-conservatively 101 scroll-margin 2)

;; Evil
(setq evil-want-keybinding nil)
(require 'evil)
(evil-mode t)

;; which-key
(setq which-key-idle-delay 0.5)
(which-key-mode)

;; ivy
(require 'ivy)
(ivy-mode t)

;; general
(require 'general)

(general-create-definer leader-keys
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "C-SPC")

(leader-keys
 :keymaps 'override
 ":" 'execute-extended-command
 "<escape>" '(keyboard-escape-quit :which-key t))

;; projectile
(require 'projectile)
(leader-keys
    :states 'normal
    "SPC" '(projectile-find-file :which-key "find file")

    "p" '(:ignore t :which-key "projects")
    "p <escape>" '(keyboard-escape-quit :which-key t)
    "p p" '(projectile-switch-project :which-key "switch project")
    "p a" '(projectile-add-known-project :which-key "add project"))
(projectile-mode +1)

(provide 'init)

;;; init.el ends here
