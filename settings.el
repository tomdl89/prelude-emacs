(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-hook 'prog-mode-hook #'hs-minor-mode)
(desktop-save-mode 1)
(doom-modeline-mode 1)
(setq doom-modeline-height 10)
(setq projectile-project-search-path "~/MetailRepos/")

;; Time in modeline
(setq display-time-24hr-format 1)
(setq display-time-default-load-average nil)
(display-time-mode 1)
