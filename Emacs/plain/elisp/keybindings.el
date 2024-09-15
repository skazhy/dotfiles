;;; keybindings.el --- Keybindings & command suggestions

(use-package which-key
  :demand
  :init
  (setq which-key-idle-delay 0.5)
  :config
  (which-key-mode))

(use-package general
  :demand
  :config
  (general-evil-setup)

  (general-create-definer leader-keys
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "C-SPC")

  (leader-keys
    ":" '(execute-extended-command :which-key "M-x")
    "<escape>" '(keyboard-escape-quit :which-key t)))

(provide 'keybindings)
