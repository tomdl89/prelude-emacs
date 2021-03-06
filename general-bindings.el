;; Basic movement keys
(general-def
  :states           '(motion normal visual)
  "m"               'evil-next-line
  "u"               'evil-previous-line
  "n"               'evil-backward-char
  "h"               'evil-forward-char)

;; Other normal keys
(general-def
  :states           'normal
  "j"               'undo
  "l"               'evil-set-marker
  "k"               'evil-ex-search-next
  "K"               'evil-ex-search-previous
  "£"               'switch-buffer-without-purpose
  "gl"              'evil-lion-left
  "gL"              'evil-lion-right
  "gm"              'evil-next-visual-line
  "gu"              'evil-previous-visual-line
  "gj"              'evil-downcase
  "zz"              'centered-cursor-mode
  "<S-tab>"         'evil-jump-backward
  "<S-iso-lefttab>" 'evil-jump-backward)

;; Other keys involving motion state
(general-def
  :states           'motion
  "k"               'evil-ex-search-next
  "K"               'evil-ex-search-previous
  "£"               'switch-buffer-without-purpose)

;; Other keys involving insert mode
(general-def
  :states           '(normal insert)
  "M-£"             'kill-this-buffer
  "C-£"             'purpose-switch-buffer-with-purpose
  "C-M-£"           'kill-some-buffers
  "<f3><f3>"        'find-file-without-purpose
  "<f3>g"           'counsel-git
  "<f3>p"           'purpose-find-file-overload
  "<f3>r"           'counsel-recentf
  "C-a"             'mark-whole-buffer
  "<C-m>"           'evil-scroll-down
  "C-*"             'highlight-thing-mode
  "C-f"             'counsel-rg ; "C-S-f" is defined below
  "C-S-d"           'deadgrep
  "C-M-m"           'evil-mc-make-cursor-move-next-line
  "M-l"             'linum-mode
  "M-;"             'sp-comment)

;; Other keys involving visual mode
(general-def
  :states           'visual
  "gx"              'evil-exchange)

;; Kill non-evil buffers
(general-def "M-£" 'kill-this-buffer)

;; Sexp keys involving insert
(general-def
  :states           '(normal insert)
  "C-."             'sp-forward-slurp-sexp
  "C-,"             'sp-backward-slurp-sexp
  "C->"             'sp-forward-barf-sexp
  "C-<"             'sp-backward-barf-sexp)

;; Handle escape
(general-def
  :keymaps          'override
  "<escape>"        'keyboard-escape-quit
  "C-c ESC"         'ignore)
(general-def 'ctl-x-map [escape] 'ignore)

;; Ivy immediate done
(general-def
  :keymaps          'ivy-mode-map
  "<C-return>"      'ivy-immediate-done)

;; Counsel-rg
(defun ivy-with-thing-at-point (cmd)
  (let ((ivy-initial-inputs-alist
         (list
          (cons cmd (thing-at-point 'symbol)))))
    (funcall cmd)))
(defun counsel-rg-thing-at-point ()
  (interactive)
  (ivy-with-thing-at-point 'counsel-rg))
(general-def :states '(normal insert) "C-S-f" 'counsel-rg-thing-at-point)
;; `C-c C-o` to bring up results buffer, and `w` to make editable

;; Deadgrep - counsel-rg usually preferred because of better replace
(general-def
  :keymaps          '(deadgrep-mode-map deadgrep-edit-mode-map)
  :states           'normal
  "RET"             'deadgrep-visit-result
  "o"               'deadgrep-visit-result-other-window
  "<tab>"           'deadgrep-toggle-file-results)
(general-def :keymaps 'deadgrep-mode-map :states 'normal "i" 'deadgrep-edit-mode)
(general-def :keymaps 'deadgrep-edit-mode-map :states 'normal "<escape>" 'deadgrep-mode)

;; Avy keys
(setq avy-keys '(?n ?t ?i ?e ?o ?s ?h ?a ?g ?y ?l ?w ?r ?d))
(general-def '(motion normal) "SPC" 'avy-goto-char)
(setq aw-keys '(?n ?i ?h ?y ?l ?r ?t ?e ?s ?a ?g ?w ?d))
(setq aw-scope 'frame)
(defun toggle-aw-dispatch-always ()
  (interactive)
  (if aw-dispatch-always
      (setq aw-dispatch-always nil)
    (setq aw-dispatch-always t)))
(general-def "<C-M-tab>" 'toggle-aw-dispatch-always)
(general-def "<C-tab>" 'ace-window)

;; Resize windows
(general-def
  ;; Guru-mode needs uninstalling for this to work
  "<C-up>"          'enlarge-window
  "<C-down>"        'shrink-window
  "<C-left>"        'enlarge-window-horizontally
  "<C-right>"       'shrink-window-horizontally)

;; Find-file with pre-filled directory
(defun find-file-emacs-personal-dir (filename &optional wildcards)
  (interactive
   (list (read-file-name "Find file: " "~/.emacs.d/personal/" nil
                         (confirm-nonexistent-file-or-buffer))))
  (let ((value (find-file-noselect filename nil nil wildcards)))
    (if (listp value)
        (mapcar 'pop-to-buffer-same-window (nreverse value))
      (pop-to-buffer-same-window value))))
(general-def :states '(normal insert) "<f3>e" 'find-file-emacs-personal-dir)

;; Purpose
(general-def
  "<f7>"            'purpose-load-window-layout
  "<C-f7>"          'purpose-save-window-layout)

;; Dired
(general-def
  :states           'normal
  :keymaps          'dired-mode-map
  "m"               'evil-next-line
  "u"               'evil-previous-line
  "n"               'evil-backward-char
  "h"               'evil-forward-char
  "l"               'dired-mark
  "L"               'dired-unmark
  "C-S-l"           'dired-do-load
  "<SPC>"           'avy-goto-char)

;; Custom functions
(defun evil-paste-after-from-zero (count)
  "Paste after from yank register, rather than unnamed register"
  (interactive "P<x>") (evil-paste-after count ?0))
(defun evil-paste-before-from-zero (count)
  "Paste before from yank register, rather than unnamed register"
  (interactive "P<x>") (evil-paste-before count ?0))
(general-def
  :states           '(normal visual)
  :keymaps          '(global evil-mc-key-map)
  "C-p"             'evil-paste-after-from-zero
  "C-S-p"           'evil-paste-before-from-zero)

(defun avy-goto-asterisk ()
  "Use avy-goto-char with asterisk, for navigating magit log"
  (interactive) (avy-goto-char ?*))

(evil-define-motion evil-search-symbol-forward (count &optional symbol)
  "Search forward for SYMBOL under point."
  :jump t
  :type exclusive
  (interactive (list (prefix-numeric-value current-prefix-arg)
                     evil-symbol-word-search))
  (dotimes (var (or count 1))
    (evil-search-word t nil t)))

;; Probably redundant. See `evil symbol word search' customization
(evil-define-motion evil-search-symbol-backward (count &optional symbol)
  "Search backward for SYMBOL under point."
  :jump t
  :type exclusive
  (interactive (list (prefix-numeric-value current-prefix-arg)
                     evil-symbol-word-search))
  (dotimes (var (or count 1))
    (evil-search-word nil nil t)))

(general-def
  :states           '(normal motion visual)
  "*"               'evil-search-symbol-forward
  "M-*"             'evil-search-word-forward
  "#"               'evil-search-symbol-backward
  "M-#"             'evil-search-word-backward)

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

(defun evil-ex-replace ()
  "Start ex command with single-line replace prefix"
  (interactive)
  (evil-ex "s/"))
;;(general-def '(normal insert) "C-f" 'evil-ex-replace)

(defun evil-select-in-line ()
  "Select all text in a line, but not the whole line"
  (interactive)
  (evil-first-non-blank)
  (evil-visual-char)
  (evil-end-of-line))

;; Differentiate C-m from RET
(when (display-graphic-p)
  (general-def input-decode-map [?\C-m] [C-m]))

;; Magit overrides
(general-def
  :keymaps          '(magit-mode-map
                      magit-file-section-map
                      magit-unstaged-section-map
                      magit-staged-section-map
                      magit-hunk-section-map)
  "u"               'evil-previous-line
  "C-u"             'magit-unstage
  "m"               'evil-next-line
  "<C-m>"           'magit-merge ;; This will bind RET in terminal mode
  "<return>"        'magit-visit-thing
  "SPC"             'avy-goto-asterisk
  "<C-tab>"         'ace-window
  "£"               'switch-buffer-without-purpose
  "<f3><f3>"        'find-file-without-purpose
  "<f3>g"           'counsel-git
  "<f3>p"           'purpose-find-file-overload
  "<f3>r"           'counsel-recentf
  "<f3>e"           'find-file-emacs-personal-dir)

(general-def
  "<f13>"           'magit-status
  "<S-f13>"         'magit-log)

(defvar repl-history-navigation-mode-map
  (make-keymap) "repl-history-navigation-mode keymap.")
(general-def
  :keymaps          'repl-history-navigation-mode-map
  "<M-up>"          'cider-repl-previous-input
  "<M-down>"        'cider-repl-next-input
  "<C-return>"      'cider-repl-newline-and-indent)
(define-minor-mode repl-history-navigation-mode
  "Mode to allow keybindings for repl history navigation"
  nil ;; Init-value
  " repl-history-nav"
  repl-history-navigation-mode-map)
(add-hook 'cider-repl-mode-hook 'repl-history-navigation-mode)

(general-unbind '(normal motion) "C-e")
(general-unbind
  :keymaps    '(evil-mc-key-map evil-normal-state-map)
  "C-n")

(general-def
  :keymaps          'cider-mode-map
  "C-e"             'cider-eval-sexp-at-point
  "C-n"             'cider-repl-set-ns)

;; Smartparens overrides
(general-def :keymaps '(smartparens-mode-map ccm-map) "M-v" 'evil-select-in-line)

;; Cleverparens overrides
(general-def
  :states           '(normal visual)
  :keymaps          '(global evil-cleverparens-mode-map)
  "{"               'evil-backward-paragraph
  "}"               'evil-forward-paragraph
  "M-l"             'linum-mode
  "X"               'fixup-whitespace
  "("               'evil-previous-open-paren
  ")"               'evil-next-close-paren)

(defvar tex-fold-key-mode-map
  (make-keymap) "tex-fold-mode keymap.")
(general-def
  :states           'normal
  :keymaps          'tex-fold-key-mode-map
  "zc"              'TeX-fold-dwim
  "zo"              'TeX-fold-dwim)
(define-minor-mode tex-fold-key-mode
  "Mode to allow keybindings for tex folding"
  nil ;; Init-value
  " tex-folding"
  tex-fold-key-mode-map)
(add-hook 'TeX-mode-hook 'tex-fold-key-mode)
