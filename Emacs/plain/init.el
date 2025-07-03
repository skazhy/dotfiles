;;; init.el --- Description -*- lexical-binding: t; -*-

;;; Code:
;; Package setup
(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq package-selected-packages '(cider evil general orderless paredit projectile vertico))

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

;; vertico
(require 'vertico)
(vertico-mode t)

(use-package orderless
  :ensure t
  :custom (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

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
    "p p" '(projectile-switch-project :which-key "switch project"))
(projectile-mode +1)

(provide 'init)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(cider evil general orderless paredit projectile vertico)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
