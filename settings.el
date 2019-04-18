(add-hook 'window-setup-hook 'toggle-frame-maximized t)
(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)
(add-hook 'prog-mode-hook 'hs-minor-mode)
(add-hook 'prog-mode-hook 'evil-commentary-mode)
(add-hook 'prog-mode-hook 'centered-cursor-mode)
(add-hook 'prog-mode-hook 'evil-quickscope-mode)
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
(setq display-time-string-forms
      '((propertize (format-time-string "%H:%M" now) 'face 'bold)))
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
(setq highlight-thing-delay-seconds 0.3)

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

;; Correct file encoding on windows
(setq utf-translate-cjk-mode nil)
(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system
 (if (eq system-type 'windows-nt)
     'utf-16-le
   'utf-8))
(prefer-coding-system 'utf-8)
