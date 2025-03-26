(setq tool-bar-mode nil menu-bar-mode nil scroll-bar-mode nil) ; Hide the outdated icons
(setq inhibit-splash-screen t) ; Remove the "Welcome to GNU Emacs" splash screen

(setq default-frame-alist '((tool-bar-lines . 0)
                            (menu-bar-lines . 0)
                            (horizontal-scroll-bars . nil)
                            (vertical-scroll-bars . nil)
                            (ns-transparent-titlebar . t)))
