(define-key evil-normal-state-map (kbd "m") 'evil-next-line)
(define-key evil-motion-state-map (kbd "m") 'evil-next-line)

(define-key evil-motion-state-map (kbd "C-m") 'evil-scroll-down)
(define-key evil-motion-state-map (kbd "C-u") 'evil-scroll-up)

(define-key evil-motion-state-map (kbd "u") 'evil-previous-line)
(define-key evil-normal-state-map (kbd "u") 'evil-previous-line)

(define-key evil-motion-state-map (kbd "h") 'evil-forward-char)
(define-key evil-normal-state-map (kbd "h") 'evil-forward-char)

(define-key evil-motion-state-map (kbd "n") 'evil-backward-char)
(define-key evil-normal-state-map (kbd "n") 'evil-backward-char)

(define-key evil-normal-state-map (kbd "k") 'evil-search-next)
(define-key evil-normal-state-map (kbd "K") 'evil-search-previous)

(define-key evil-normal-state-map (kbd "j") 'undo)

(define-key evil-normal-state-map (kbd "l") 'evil-set-marker)

(define-key evil-insert-state-map (kbd "C-.") 'sp-forward-slurp-sexp)
(define-key evil-normal-state-map (kbd "C-.") 'sp-forward-slurp-sexp)
(define-key evil-insert-state-map (kbd "C-,") 'sp-backward-slurp-sexp)
(define-key evil-normal-state-map (kbd "C-,") 'sp-backward-slurp-sexp)
(define-key evil-insert-state-map (kbd "C->") 'sp-forward-barf-sexp)
(define-key evil-normal-state-map (kbd "C->") 'sp-forward-barf-sexp)
(define-key evil-insert-state-map (kbd "C-<") 'sp-backward-barf-sexp)
(define-key evil-normal-state-map (kbd "C-<") 'sp-backward-barf-sexp)

(define-key evil-normal-state-map (kbd "SPC") 'avy-goto-char)
(define-key evil-motion-state-map (kbd "SPC") 'avy-goto-char)
(define-key evil-motion-state-map (kbd "\\") 'avy-goto-char-2)
;; Avy customization
(setq avy-keys '(?a ?s ?e ?t ?g ?n ?i ?o ?h ?w ?d ?r ?l))

(global-set-key [C-tab] 'ace-window)
(define-key ivy-minibuffer-map [escape] 'minibuffer-keyboard-quit)

(defun evil-paste-from-zero (count)
    "Always paste from yank register, rather than unnamed register"
    (interactive "P<x>") (evil-paste-after count ?0))
(define-key evil-normal-state-map (kbd "p") 'evil-paste-from-zero)
;; Allow old `p` behaviour if using Ctrl
(define-key evil-normal-state-map (kbd "C-p") 'evil-paste-after)
