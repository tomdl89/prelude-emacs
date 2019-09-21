;(setq guru-global-mode nil) ;; Incredibly irritating mode
;(setq guru-mode nil) ;; Incredibly irritating mode
(add-hook 'window-setup-hook 'toggle-frame-maximized t)
;(add-hook 'window-setup-hook 'toggle-frame-fullscreen t) ;; Not needed in i3!
(add-hook 'prog-mode-hook 'hs-minor-mode)
(add-hook 'prog-mode-hook 'evil-commentary-mode)
(add-hook 'prog-mode-hook 'evil-owl-mode)
(add-hook 'prog-mode-hook 'centered-cursor-mode)
;; Cider repl mode is derived from fundamental, not prog...
(add-hook 'cider-repl-mode-hook 'centered-cursor-mode)
;; Magit mode is derived from special, not prog...
(add-hook 'magit-mode-hook 'centered-cursor-mode)
(add-hook 'prog-mode-hook 'evil-quickscope-mode)
(add-hook 'prog-mode-hook 'evil-fringe-mark-mode)
(setq-default right-fringe-width 16)
(setq-default evil-fringe-mark-side 'right-fringe)
(setq-default evil-fringe-mark-show-special t)
(add-hook 'org-mode-hook 'org-bullets-mode)
(add-hook 'TeX-mode-hook 'TeX-fold-mode)

;; Change directory to othersRepos when starting
(cd "~/othersrepos/")

;; Make recentf list length much longer
(setq recentf-max-menu-items 200)
(setq recentf-max-saved-items 200)

;; Use anonymous start buffer
(setq initial-buffer-choice (lambda () (get-buffer-create "**")))

;; LSP config
(defun disable-lsp-ui-sideline-mode () (lsp-ui-sideline-enable nil))
(dolist (hook '(rjsx-mode-hook
                js2-mode-hook
                clojure-mode-hook
                clojurec-mode-hook
                clojurescript-mode-hook))
  (add-hook hook 'disable-lsp-ui-sideline-mode)
  (add-hook hook 'lsp))
(setq lsp-enable-snippet nil)

;; Purpose
(purpose-mode)
(add-to-list 'purpose-user-mode-purposes '(js2-mode . js))
(add-to-list 'purpose-user-mode-purposes '(clojure-mode . clj))
(add-to-list 'purpose-user-mode-purposes '(clojurec-mode . clj))
(add-to-list 'purpose-user-mode-purposes '(clojurescript-mode . clj))
(add-to-list 'purpose-user-mode-purposes '(cider-repl-mode . crm))
(purpose-compile-user-configuration)

;; Disable auto-revert messages
(setq auto-revert-verbose nil)

;; Latex
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq TeX-PDF-mode t)

;; Require evil-anzu for search counts in modeline
(with-eval-after-load 'evil
  (require 'evil-anzu))

;; Modeline settings
(doom-modeline-def-segment purpose-status
  (let ((pms (purpose--modeline-string)))
    (and (string-match "[#!]+" pms)
         (match-string 0       pms))))
(doom-modeline-def-modeline 'tomline
  '(bar workspace-name window-number modals matches
    buffer-info " " purpose-status remote-host selection-info)
  '(objed-state persp-name fancy-battery irc mu4e github debug lsp
                minor-modes input-method " " major-mode process vcs checker))
(defun setup-custom-doom-modeline ()
  (doom-modeline-set-modeline 'tomline 'default))
(add-hook 'doom-modeline-mode-hook 'setup-custom-doom-modeline)
(setq doom-modeline-height 1)
(set-face-attribute 'mode-line nil :height 100)
(setq doom-modeline-buffer-file-name-style 'truncate-except-project)
(doom-modeline-mode 1)
(setq which-function-mode nil)

;; Time in modeline
;; (setq display-time-string-forms
;;       '((propertize (format-time-string "%H:%M" now) 'face 'bold)))
;; (setq display-time-default-load-average nil)
;; (display-time-mode 1)

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

;; Evil search module - only worth enabling for cgn
;(setq evil-search-module 'evil-search)

;; Evil traces settings
(evil-traces-mode)
(evil-traces-use-diff-faces)

;; Highlight thing mode
(setq highlight-thing-delay-seconds 0.3)

;; Set column after which text is highlighted
(setq whitespace-line-column 100)

;; Set gdefault for substitutions
(setq-default evil-ex-substitute-global t)

;; Evil mc mode everywhere
(global-evil-mc-mode  1)
(general-def
  :states   'normal
  :keymaps  'evil-mc-key-map
  "C-p"     'evil-paste-after-from-zero
  "C-S-p"   'evil-paste-before-from-zero)

;; Add jsxinc to auto mode list
 (add-to-list 'auto-mode-alist '("\\.jsxinc\\'" . js-jsx-mode))

;; (require 'smartparens-config)
(add-hook 'clojure-mode-hook 'smartparens-mode)
(add-hook 'clojure-mode-hook 'smartparens-strict-mode)
(add-hook 'clojure-mode-hook 'evil-cleverparens-mode)
(add-hook 'lisp-mode-hook    'smartparens-mode)
(add-hook 'lisp-mode-hook    'smartparens-strict-mode)
(add-hook 'lisp-mode-hook    'evil-cleverparens-mode)

;; Add auto-alignment in clojure
(setq clojure-align-forms-automatically t)

;; Setup cider for figwheel
(setq cider-cljs-lein-repl
	"(do (require 'figwheel-sidecar.repl-api)
         (figwheel-sidecar.repl-api/start-figwheel!)
         (figwheel-sidecar.repl-api/cljs-repl))")

(setq org-capture-templates
    '(("t" "Todo" entry (file "~/Org/Refile.org")
       "* TODO %?\n%U" :empty-lines 1)
      ("T" "Todo with Clipboard" entry (file "~/Org/Refile.org")
       "* TODO %?\n%U\n   %c" :empty-lines 1)
      ("n" "Note" entry (file "~/Org/Refile.org")
       "* NOTE %?\n%U" :empty-lines 1)
      ("N" "Note with Clipboard" entry (file "~/Org/Refile.org")
       "* NOTE %?\n%U\n   %c" :empty-lines 1)
      ("e" "Event" entry (file+headline "~/Org/Events.org" "Transient")
       "* EVENT %?\n%U" :empty-lines 1)
      ("E" "Event With Clipboard" entry (file+headline "~/Org/Events.org" "Transient")
       "* EVENT %?\n%U\n   %c" :empty-lines 1)))

;; Ace-window dispatch always
(setq aw-dispatch-always t)

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
