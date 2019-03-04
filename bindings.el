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

(define-key evil-normal-state-map (kbd "H") 'sp-next-sexp)
(define-key evil-normal-state-map (kbd "N") 'sp-backward-sexp)
(define-key evil-normal-state-map (kbd "U") 'sp-up-sexp)
(define-key evil-normal-state-map (kbd "M") 'sp-down-sexp)

(define-key evil-normal-state-map (kbd "C-a") 'mark-whole-buffer)
(define-key evil-insert-state-map (kbd "C-a") 'mark-whole-buffer)

(define-key evil-normal-state-map (kbd "£") 'counsel-find-file)
(define-key evil-normal-state-map (kbd "<f3>") 'counsel-recentf)
(define-key evil-normal-state-map (kbd "b") 'counsel-switch-buffer)
(define-key evil-normal-state-map (kbd "B") 'kill-buffer)
(define-key evil-normal-state-map (kbd "C-b") 'evil-backward-word-begin)
(define-key evil-normal-state-map (kbd "C-B") 'evil-backward-WORD-begin)


(define-key evil-normal-state-map (kbd "SPC") 'avy-goto-char)
(define-key evil-motion-state-map (kbd "SPC") 'avy-goto-char)
(define-key evil-motion-state-map (kbd "\\") 'avy-goto-char-2)
;; Avy customization
(setq avy-keys '(?a ?s ?e ?t ?g ?n ?i ?o ?h ?w ?d ?r ?l))

(global-set-key [C-tab] 'ace-window)
(define-key ivy-minibuffer-map [escape] 'minibuffer-keyboard-quit)

(defun evil-paste-from-zero (count)
  "Paste from yank register, rather than unnamed register"
  (interactive "P<x>") (evil-paste-after count ?0))
(define-key evil-normal-state-map (kbd "C-p") 'evil-paste-from-zero)
