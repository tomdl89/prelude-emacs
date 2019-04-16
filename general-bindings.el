;; Basic movement keys
(general-def
  :states     '(motion normal visual)
  "m"         'evil-next-line
  "u"         'evil-previous-line
  "n"         'evil-backward-char
  "h"         'evil-forward-char
  "H"         'evil-end-of-line
  "N"         'evil-first-non-blank)

;; Other normal keys
(general-def
  :states     'normal
  "<C-m>"     'evil-scroll-down
  "C-u"       'evil-scroll-up
  "j"         'undo
  "l"         'evil-set-marker
  "k"         'evil-search-next
  "K"         'evil-search-previous
  "£"         'counsel-switch-buffer
  "C-£"       'counsel-find-file
  "M-£"       'kill-buffer
  "<f3>"      'counsel-recentf
  "C-*"       'highlight-thing-mode
  "C-F"       'counsel-git-grep
  "C-M-m"     'evil-mc-make-cursor-move-next-line
  "gl"        'evil-lion-left
  "gL"        'evil-lion-right
  "zz"        'centered-cursor-mode
  "X"         'fixup-whitespace)

;; Other keys involving motion state
(general-def
  :states     'motion
  "k"         'evil-search-next
  "K"         'evil-search-previous
  "£"         'counsel-switch-buffer
  "C-£"       'counsel-find-file
  "M-£"       'kill-buffer
  "<f3>"      'counsel-recentf
  "("         'evil-previous-open-paren
  ")"         'evil-next-close-paren)

;; Other keys involving insert mode
(general-def
  :states     '(normal insert)
  "C-a"       'mark-whole-buffer)

;; Other keys involving visual mode
(general-def
  :states     'visual
  "gx"        'evil-exchange)

;; Sexp keys involving insert
(general-def
  :states     '(normal insert)
  "C-."       'sp-forward-slurp-sexp
  "C-,"       'sp-backward-slurp-sexp
  "C->"       'sp-forward-barf-sexp
  "C-<"       'sp-backward-barf-sexp)

;; Handle escape
(general-def
  :keymaps    'override
  "<escape>"  'keyboard-escape-quit
  "C-c ESC"   'ignore)
(general-def 'ctl-x-map [escape] 'ignore)

;; Avy keys
(setq avy-keys '(?n ?t ?i ?e ?o ?s ?h ?a ?g ?y ?l ?w ?r ?d))
(general-def :states '(motion normal) "SPC" 'avy-goto-char)
(setq aw-keys '(?n ?i ?h ?y ?l ?r ?t ?e ?s ?a ?g ?w ?d))
(setq aw-scope 'frame)
(general-def "<C-tab>" 'ace-window)

;; Resize windows
(general-def
  :states     '(normal insert motion)
  "<C-up>"    'enlarge-window
  "<C-down>"  'shrink-window
  "<C-left>"  'shrink-window-horizontally
  "<C-right>" 'enlarge-window-horizontally)

;; Custom functions
(defun evil-paste-after-from-zero (count)
  "Paste after from yank register, rather than unnamed register"
  (interactive "P<x>") (evil-paste-after count ?0))
(defun evil-paste-before-from-zero (count)
  "Paste before from yank register, rather than unnamed register"
  (interactive "P<x>") (evil-paste-before count ?0))
(general-def
  :states     'normal
  "C-p"       'evil-paste-after-from-zero
  "C-P"       'evil-paste-before-from-zero)

(defun avy-goto-asterisk ()
  "Use avy-goto-char with asterisk, for navigating magit log"
  (interactive) (avy-goto-char ?*))

(defun evil-search-forward-symbol ()
  "Search forward for symbol at point, rather than word"
  (interactive) (evil-search-word t nil t))
(defun evil-search-backward-symbol ()
  "Search backward for symbol at point, rather than word"
  (interactive) (evil-search-word nil nil t))
(general-def
  :states     '(normal motion visual)
  "*"         'evil-search-forward-symbol
  "M-*"       'evil-search-word-forward
  "#"         'evil-search-backward-symbol
  "M-#"       'evil-search-word-backward)

(defun evil-insert-line-below-and-above ()
  "Open a line below and above the current line"
  (interactive)
  (evil-insert-newline-below)
  (evil-insert-newline-above))
(general-def 'normal "C-o" 'evil-insert-line-below-and-above)

(defun evil-execute-q-macro (count)
  "Execute the q macro, the only one I use"
  (interactive "P<x>") (evil-execute-macro count "@q"))
(general-def 'normal "Q" 'evil-execute-q-macro)

;; Differentiate C-m from RET
(general-def input-decode-map [?\C-m] [C-m])

;; Magit overrides
(general-def
  :keymaps    '(magit-mode-map
                magit-file-section-map
                magit-unstaged-section-map
                magit-staged-section-map
                magit-hunk-section-map)
  "u"         'evil-previous-line
  "C-u"       'magit-unstage
  "m"         'evil-next-line
  "<C-m>"     'magit-merge
  "<return>"  'magit-visit-thing
  "SPC"       'avy-goto-asterisk
  "<C-tab>"   'ace-window
  "£"         'counsel-switch-buffer
  "C-£"       'counsel-find-file
  "M-£"       'kill-buffer
  "<f3>"      'counsel-recentf)
