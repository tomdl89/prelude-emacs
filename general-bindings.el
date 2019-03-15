;; Basic movement keys
(general-def
  :states   '(motion normal visual)
  "m"       'evil-next-line
  "u"       'evil-previous-line
  "n"       'evil-backward-char
  "h"       'evil-forward-char)

;; Other normal keys
(general-def
  :states   'normal
  "C-m"     'evil-scroll-down
  "C-u"     'evil-scroll-up
  "j"       'undo
  "l"       'evil-set-marker
  "k"       'evil-search-next
  "K"       'evil-search-previous
  "£"       'counsel-find-file
  "<f3>"    'counsel-recentf
  "b"       'counsel-switch-buffer
  "B"       'kill-buffer
  "C-b"     'evil-backward-word-begin
  "C-B"     'evil-backward-word-begin
  "C-*"     'highlight-thing-mode
  "C-M-m"   'evil-mc-make-cursor-move-next-line)

;; Other keys involving motion state
(general-def
  :states   'motion
  "b"       'counsel-switch-buffer
  "B"       'kill-buffer
  "C-b"     'evil-backward-word-begin
  "C-B"     'evil-backward-word-begin)

;; Other keys involving insert mode
(general-def
  :states   '(normal insert)
  "C-a"     'mark-whole-buffer)

;; Sexp normal keys
(general-def
  :states   'normal
  "H"       'sp-next-sexp
  "N"       'sp-backward-sexp
  "U"       'sp-up-sexp
  "M"       'sp-down-sexp)

;; Sexp keys involving insert
(general-def
  :states   '(normal insert)
  "C-."     'sp-forward-slurp-sexp
  "C-,"     'sp-backward-slurp-sexp
  "C->"     'sp-forward-barf-sexp
  "C-<"     'sp-backward-barf-sexp)

;; Avy keys
(setq avy-keys '(?n ?t ?i ?e ?o ?s ?h ?a ?g ?y ?l ?w ?r ?d))
(general-def :states '(motion normal) "SPC" 'avy-goto-char)
(general-def "<C-tab>" 'ace-window)

;; Ivy minibuffer escape
(general-def :keymaps 'ivy-minibuffer-map "ESC" 'minibuffer-keyboard-quit)

;; Custom functions
(defun evil-paste-after-from-zero (count)
  "Paste after from yank register, rather than unnamed register"
  (interactive "P<x>") (evil-paste-after count ?0))
(defun evil-paste-before-from-zero (count)
  "Paste before from yank register, rather than unnamed register"
  (interactive "P<x>") (evil-paste-before count ?0))
(general-def
  :states   'normal
  "C-p"     'evil-paste-after-from-zero
  "C-P"     'evil-paste-before-from-zero)

;; Magit overrides
(general-def
  :keymaps  '(magit-mode-map magit-file-section-map)
  "u"       'evil-previous-line
  "C-u"     'magit-unstage
  "m"       'evil-next-line
  "C-m"     'magit-merge
  "<C-tab>" 'ace-window
  "£"       'counsel-find-file
  "<f3>"    'counsel-recentf)
