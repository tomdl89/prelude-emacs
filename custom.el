(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(ccm-recenter-at-end-of-file t)
 '(custom-safe-themes
   '("1068ae7acf99967cc322831589497fee6fb430490147ca12ca7dd3e38d9b552a" "04232a0bfc50eac64c12471607090ecac9d7fd2d79e388f8543d1c5439ed81f5" "d057f0430ba54f813a5d60c1d18f28cf97d271fd35a36be478e20924ea9451bd" "e39ff005e524c331b08d613109bff0b55fc21c64914c4a243faa70f330015389" default))
 '(evil-cross-lines t)
 '(evil-ex-search-vim-style-regexp t)
 '(evil-jumps-cross-buffers nil)
 '(evil-magic (quote very-magic))
 '(evil-search-module 'evil-search)
 '(evil-want-Y-yank-to-eol t)
 '(js-indent-level 2)
 '(package-selected-packages
   '(evil-anzu clj-refactor adoc-mode wgrep deadgrep evil-owl frog-jump-buffer smex evil-traces use-package auctex evil-fringe-mark org-bullets powershell restart-emacs psession window-purpose ein centered-cursor-mode evil-quickscope evil-commentary prettier-js rjsx-mode evil-lion yaml-mode general evil-cleverparens evil-mc highlight-thing highlight-indent-guides evil-exchange doom-modeline evil-leader zerodark-theme clojure-mode geiser lsp-ui company-lsp json-mode js2-mode rainbow-mode elisp-slime-nav rainbow-delimiters company counsel swiper ivy exec-path-from-shell zop-to-char zenburn-theme which-key volatile-highlights undo-tree super-save smartrep smartparens projectile operate-on-number move-text magit imenu-anywhere hl-todo gitignore-mode gitconfig-mode git-timemachine gist flycheck expand-region editorconfig easy-kill discover-my-major diminish diff-hl crux browse-kill-ring beacon anzu ace-window))
 '(recentf-filename-handlers '(abbreviate-file-name))
 '(safe-local-variable-values
   '((eval font-lock-add-keywords nil
           `((,(concat "("
                       (regexp-opt
                        '("sp-do-move-op" "sp-do-move-cl" "sp-do-put-op" "sp-do-put-cl" "sp-do-del-op" "sp-do-del-cl")
                        t)
                       "\\_>")
              1 'font-lock-variable-name-face))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#282c34" :foreground "#abb2bf" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "Unknown" :family "Fira Code"))))
 '(evil-ex-substitute-matches ((t (:inherit diff-removed :foreground unspecified :background unspecified))))
 '(evil-ex-substitute-replacement ((t (:inherit diff-added :foreground unspecified :background unspecified))))
 '(evil-traces-change ((t (:inherit diff-removed))))
 '(evil-traces-copy-preview ((t (:inherit diff-added))))
 '(evil-traces-copy-range ((t (:inherit diff-changed))))
 '(evil-traces-delete ((t (:inherit diff-removed))))
 '(evil-traces-global-match ((t (:inherit diff-added))))
 '(evil-traces-global-range ((t (:inherit diff-changed))))
 '(evil-traces-join-indicator ((t (:inherit diff-added))) t)
 '(evil-traces-join-range ((t (:inherit diff-changed))))
 '(evil-traces-move-preview ((t (:inherit diff-added))))
 '(evil-traces-move-range ((t (:inherit diff-removed))))
 '(evil-traces-normal ((t (:inherit diff-changed))))
 '(evil-traces-shell-command ((t (:inherit diff-changed))))
 '(evil-traces-substitute-range ((t (:inherit diff-changed))))
 '(evil-traces-yank ((t (:inherit diff-changed))))
 '(hi-yellow ((t (:background "#4e5565")))))
