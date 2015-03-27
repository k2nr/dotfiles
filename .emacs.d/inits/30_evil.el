(evil-mode 1)

(setq evil-auto-indent t
      evil-want-C-u-scroll t
      evil-echo-state nil
      evil-want-C-i-jump nil
      evil-search-module 'evil-search
      evil-ex-search-vim-style-regexp t)

;; use default emacs key bindings
(dolist (key '("C-e" "C-y" "C-k" "C-n" "C-p" "C-t" "C-d"))
  (define-key evil-insert-state-map (kbd key) nil))

(add-hook 'emacs-lisp-mode-hook 'evil-paredit-mode)
(add-hook 'clojure-mode-hook    'evil-paredit-mode)
(add-hook 'scheme-mode-hook     'evil-paredit-mode)
(add-hook 'lisp-mode-hook       'evil-paredit-mode)

(global-evil-surround-mode 1)
