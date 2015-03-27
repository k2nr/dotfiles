(require 'shared-funs)

(defun lisp-shared-hook ()
  (turn-on-paredit)
  (evil-paredit-mode)
  (custom-set-variables '(tab-width 2))

  (define-key paredit-mode-map (kbd "M-[") 'paredit-wrap-square)
  (define-key paredit-mode-map (kbd "M-{") 'paredit-wrap-curly))

;; common lisp
(add-hook 'lisp-mode-hook 'lisp-shared-hook)
(add-hook 'lisp-mode-hook (lambda ()
                            (require 'slime)
                            (define-key slime-mode-map (kbd "C-c C-s") 'slime)
                            (slime-mode t)))

(font-lock-add-keywords 'lisp-mode
                        '(("(\\|)" . 'esk-paren-face)))

;;emacs lisp
(defun esk-remove-elc-on-save ()
  "If you're saving an elisp file, likely the .elc is no longer valid."
  (make-local-variable 'after-save-hook)
  (add-hook 'after-save-hook
            (lambda ()
              (if (file-exists-p (concat buffer-file-name "c"))
                  (delete-file (concat buffer-file-name "c"))))))

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'esk-remove-elc-on-save)
(add-hook 'emacs-lisp-mode-hook 'lisp-shared-hook)

(font-lock-add-keywords 'emacs-lisp-mode
                        '(("(\\|)" . 'esk-paren-face)))

;; scheme
(defun scheme-other-window ()
  "Run scheme on other window"
  (interactive)
  (switch-to-buffer-other-window
   (get-buffer-create "*scheme*"))
  (run-scheme scheme-program-name))
;(require 'quack)
(add-hook 'scheme-mode-hook 'lisp-shared-hook)
(add-hook 'scheme-mode-hook (lambda ()
                              (require 'cmuscheme)
                              (setq scheme-program-name "gosh -i")
                              (global-set-key (kbd "C-c C-s") 'scheme-other-window)))

(font-lock-add-keywords 'scheme-mode
                        '(("(\\|)" . 'esk-paren-face)))

;; clojure
(defun clojure-shared-hook ()
  (lisp-shared-hook)
  (clj-refactor-mode 1)
  (modify-syntax-entry ?- "w" clojure-mode-syntax-table))

(defun cider-shared-hook ()
  (cider-turn-on-eldoc-mode)
;  (ac-flyspell-workaround)
  (ac-cider-setup)
  ;; insert keybinding setup here
  )

(add-hook 'clojure-mode-hook    'clojure-shared-hook)
(add-hook 'cider-mode-hook      'cider-shared-hook)
(add-hook 'cider-repl-mode-hook 'cider-shared-hook)

(eval-after-load "auto-complete" '(progn
                                    (add-to-list 'ac-modes 'cider-mode)
                                    (add-to-list 'ac-modes 'cider-repl-mode)))
