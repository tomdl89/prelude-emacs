(add-hook 'window-setup-hook 'toggle-frame-maximized t)
(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)
(add-hook 'prog-mode-hook 'hs-minor-mode)
(add-hook 'prog-mode-hook 'evil-commentary-mode)
(desktop-save-mode 1)

;; Modeline settings
(doom-modeline-def-modeline 'tomline
  '(bar workspace-number window-number evil-state god-state
        ryo-modal xah-fly-keys matches buffer-info remote-host
        ;buffer-position parrot
        selection-info)
  '(persp-name lsp irc mu4e github debug fancy-battery
               minor-modes input-method
              ;buffer-encoding
              major-mode process vcs checker misc-info ))
(defun setup-custom-doom-modeline ()
  (doom-modeline-set-modeline 'tomline 'default))
(add-hook 'doom-modeline-mode-hook 'setup-custom-doom-modeline)
(setq doom-modeline-height 10)
(doom-modeline-mode 1)
(setq which-function-mode nil)

;; Time in modeline
(setq display-time-24hr-format 1)
(setq display-time-default-load-average nil)
(display-time-mode 1)

(setq projectile-project-search-path "~/MetailRepos/")

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
(general-def
  :states   'normal
  :keymaps  'evil-mc-key-map
  "C-p"     'evil-paste-after-from-zero
  "C-S-p"   'evil-paste-before-from-zero)

;; Add jsxinc to auto mode list
 (add-to-list 'auto-mode-alist '("\\.jsxinc\\'" . js-jsx-mode))

;; Evil-clever-parens in lisps
(add-hook 'clojure-mode #'evil-cleverparens-mode)
(add-hook 'lisp-mode    #'evil-cleverparens-mode)

;; Add auto-alignment in clojure
(setq clojure-align-forms-automatically t)
