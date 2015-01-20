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

(defadvice evil-paste-pop (around evil-paste-or-move-line activate)
  "If there is no just-yanked stretch of killed text, just move to previous line."
  (condition-case err
      ad-do-it
    (error (if (eq this-command 'evil-paste-pop)
               (call-interactively 'previous-line)
             (signal (car err) (cdr err))))))

(defadvice evil-paste-pop-next (around evil-paste-or-move-line activate)
  "If there is no just-yanked stretch of killed text, just move to next line."
  (condition-case err
      ad-do-it
    (error (if (eq this-command 'evil-paste-pop-next)
               (call-interactively 'next-line)
             (signal (car err) (cdr err))))))

(add-hook 'emacs-lisp-mode-hook 'evil-paredit-mode)
(add-hook 'clojure-mode-hook    'evil-paredit-mode)
(add-hook 'scheme-mode-hook     'evil-paredit-mode)
(add-hook 'lisp-mode-hook       'evil-paredit-mode)

(global-evil-surround-mode 1)