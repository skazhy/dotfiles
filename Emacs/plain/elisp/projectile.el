;;; projectile.el --- Projectile config 

(use-package projectile
  :demand
   :general
  (leader-keys
    :states 'normal
    "SPC" '(projectile-find-file :which-key "find file")

    "p" '(:ignore t :which-key "projects")
    "p <escape>" '(keyboard-escape-quit :which-key t)
    "p p" '(projectile-switch-project :which-key "switch project")
    "p a" '(projectile-add-known-project :which-key "add project"))
  :init
  (projectile-mode +1))

(provide 'projectile)
