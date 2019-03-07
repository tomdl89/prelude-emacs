(add-hook 'window-setup-hook 'toggle-frame-maximized t)
(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)
(add-hook 'prog-mode-hook #'hs-minor-mode)
(desktop-save-mode 1)
(doom-modeline-mode 1)
(setq doom-modeline-height 10)
(setq projectile-project-search-path "~/MetailRepos/")

;; Time in modeline
(setq display-time-24hr-format 1)
(setq display-time-default-load-average nil)
(display-time-mode 1)

(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-auto-odd-face-perc 20)
(setq highlight-indent-guides-auto-even-face-perc 20)
(setq highlight-indent-guides-auto-character-face-perc 5)
(setq highlight-indent-guides-character ?\u2502)
(setq highlight-indent-guides-method 'character)
(setq highlight-indent-guides-responsive 'top)

;; Highlight thing mode
(setq highlight-thing-delay-seconds 0.2)

;; Set column after which text is highlighted
(setq whitespace-line-column 100)

;; Evil mc mode everywhere
(global-evil-mc-mode  1)
