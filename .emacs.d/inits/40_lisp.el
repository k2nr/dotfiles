(require 'shared-funs)

(defface esk-paren-face
  '((((class color) (background dark))
     (:foreground "grey50"))
    (((class color) (background light))
     (:foreground "grey55")))
  "Face used to dim parentheses."
  :group 'starter-kit-faces)

(defun lisp-shared-hook ()
  (turn-on-paredit)
  (evil-paredit-mode)
  (custom-set-variables '(tab-width 2))
  (modify-syntax-entry ?- "w" lisp-mode-syntax-table)
  (modify-syntax-entry ?- "w" clojure-mode-syntax-table)

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
(require 'quack)
(add-hook 'scheme-mode-hook 'lisp-shared-hook)
(add-hook 'scheme-mode-hook (lambda ()
                              (require 'cmuscheme)
                              (setq scheme-program-name "gosh -i")
                              (global-set-key (kbd "C-c C-s") 'scheme-other-window)))

(font-lock-add-keywords 'scheme-mode
                        '(("(\\|)" . 'esk-paren-face)))

;; clojure
(require 'clojure-mode)
(require 'cider)
(add-hook 'clojure-mode-hook 'lisp-shared-hook)
(font-lock-add-keywords 'clojure-mode
                        '(("(\\|)" . 'esk-paren-face)))

;; turn on eldoc mode on the current buffer
(add-hook 'cider-mode-hook
  'cider-turn-on-eldoc-mode)

(add-hook 'cider-mode-hook 'lisp-shared-hook)

;; ac-nrepl
 (require 'ac-nrepl)
 (add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
 (add-hook 'cider-mode-hook 'ac-nrepl-setup)
 (eval-after-load "auto-complete"
   '(add-to-list 'ac-modes 'cider-repl-mode))

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

(add-hook 'cider-repl-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)
