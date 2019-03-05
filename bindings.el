(define-key evil-normal-state-map "m" 'evil-next-line)
(define-key evil-motion-state-map "m" 'evil-next-line)

(define-key evil-motion-state-map (kbd "C-m") 'evil-scroll-down)
(define-key evil-motion-state-map (kbd "C-u") 'evil-scroll-up)

(define-key evil-motion-state-map "u" 'evil-previous-line)
(define-key evil-normal-state-map "u" 'evil-previous-line)

(define-key evil-motion-state-map "h" 'evil-forward-char)
(define-key evil-normal-state-map "h" 'evil-forward-char)

(define-key evil-motion-state-map "n" 'evil-backward-char)
(define-key evil-normal-state-map "n" 'evil-backward-char)

(define-key evil-normal-state-map "k" 'evil-search-next)
(define-key evil-normal-state-map "k" 'evil-search-previous)

(define-key evil-normal-state-map "j" 'undo)

(define-key evil-normal-state-map "l" 'evil-set-marker)

(define-key evil-insert-state-map (kbd "C-.") 'sp-forward-slurp-sexp)
(define-key evil-normal-state-map (kbd "C-.") 'sp-forward-slurp-sexp)
(define-key evil-insert-state-map (kbd "C-,") 'sp-backward-slurp-sexp)
(define-key evil-normal-state-map (kbd "C-,") 'sp-backward-slurp-sexp)
(define-key evil-insert-state-map (kbd "C->") 'sp-forward-barf-sexp)
(define-key evil-normal-state-map (kbd "C->") 'sp-forward-barf-sexp)
(define-key evil-insert-state-map (kbd "C-<") 'sp-backward-barf-sexp)
(define-key evil-normal-state-map (kbd "C-<") 'sp-backward-barf-sexp)

(define-key evil-normal-state-map "H" 'sp-next-sexp)
(define-key evil-normal-state-map "N" 'sp-backward-sexp)
(define-key evil-normal-state-map "U" 'sp-up-sexp)
(define-key evil-normal-state-map "M" 'sp-down-sexp)

(define-key evil-normal-state-map (kbd "C-a") 'mark-whole-buffer)
(define-key evil-insert-state-map (kbd "C-a") 'mark-whole-buffer)

(define-key evil-normal-state-map (kbd "£") 'counsel-find-file)
(define-key evil-normal-state-map (kbd "<f3>") 'counsel-recentf)
(define-key evil-normal-state-map "b" 'counsel-switch-buffer)
(define-key evil-normal-state-map "B" 'kill-buffer)
(define-key evil-normal-state-map (kbd "C-b") 'evil-backward-word-begin)
(define-key evil-normal-state-map (kbd "C-B") 'evil-backward-WORD-begin)

(define-key evil-normal-state-map (kbd "C-*") 'highlight-thing-mode)

(define-key evil-normal-state-map (kbd "SPC") 'avy-goto-char)
(define-key evil-motion-state-map (kbd "SPC") 'avy-goto-char)
(define-key evil-motion-state-map (kbd "\\") 'avy-goto-char-2)
;; Avy customization
(setq avy-keys '(?a ?s ?e ?t ?g ?n ?i ?o ?h ?w ?d ?r ?l))

(global-set-key [C-tab] 'ace-window)
(define-key ivy-minibuffer-map [escape] 'minibuffer-keyboard-quit)

(defun evil-paste-after-from-zero (count)
  "Paste after from yank register, rather than unnamed register"
  (interactive "P<x>") (evil-paste-after count ?0))
(defun evil-paste-before-from-zero (count)
  "Paste before from yank register, rather than unnamed register"
  (interactive "P<x>") (evil-paste-before count ?0))
(define-key evil-normal-state-map (kbd "C-p") 'evil-paste-after-from-zero)
(define-key evil-normal-state-map (kbd "C-S-p") 'evil-paste-before-from-zero)

(evil-add-hjkl-bindings magit-status-mode-map 'emacs
  "m" 'evil-next-visual-line)
