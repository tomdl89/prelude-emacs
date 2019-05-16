(add-hook 'window-setup-hook 'toggle-frame-maximized t)
(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)
(add-hook 'prog-mode-hook 'hs-minor-mode)
(add-hook 'prog-mode-hook 'evil-commentary-mode)
(add-hook 'prog-mode-hook 'centered-cursor-mode)
;; Cider repl mode is derived from fundamental, not prog...
(add-hook 'cider-repl-mode-hook 'centered-cursor-mode)
;; Magit mode is derived from special, not prog...
(add-hook 'magit-mode 'centered-cursor-mode)
(add-hook 'prog-mode-hook 'evil-quickscope-mode)
(add-hook 'lisp-mode-hook 'evil-cleverparens-mode)

;; LSP config
(add-hook 'rjsx-mode-hook 'lsp)
(defun disable-lsp-ui-sideline-mode () (lsp-ui-sideline-enable nil))
(add-hook 'rjsx-mode-hook 'disable-lsp-ui-sideline-mode)

;; Purpose
(purpose-mode)
(add-to-list 'purpose-user-mode-purposes '(js2-mode . js))
(purpose-compile-user-configuration)

;; Modeline settings
(doom-modeline-def-segment purpose-status
  (let ((pms (purpose--modeline-string)))
    (and (string-match "[#!]+" pms)
         (match-string 0       pms))))
(doom-modeline-def-modeline 'tomline
  '(bar workspace-name window-number modals matches
    buffer-info " " purpose-status remote-host selection-info)
  '(objed-state persp-name fancy-battery irc mu4e github debug lsp
    minor-modes input-method " " major-mode process vcs checker misc-info))
(defun setup-custom-doom-modeline ()
  (doom-modeline-set-modeline 'tomline 'default))
(add-hook 'doom-modeline-mode-hook 'setup-custom-doom-modeline)
(setq doom-modeline-height 10)
(setq doom-modeline-buffer-file-name-style 'truncate-except-project)
(doom-modeline-mode 1)
(setq which-function-mode nil)

;; Time in modeline
(setq display-time-string-forms
      '((propertize (format-time-string "%H:%M" now) 'face 'bold)))
(setq display-time-default-load-average nil)
(display-time-mode 1)

;; Purpose settings
(setq purpose-layout-dirs '("~/.emacs.d/personal/layouts/"))

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
