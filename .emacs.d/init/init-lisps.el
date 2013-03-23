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
  (custom-set-variables '(tab-width 2)))

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
(add-hook 'clojure-mode-hook 'lisp-shared-hook)
(font-lock-add-keywords 'clojure-mode
                        '(("(\\|)" . 'esk-paren-face)))

;; C-c C-z to switch nREPL buffer
(add-to-list 'same-window-buffer-names "*nrepl*")
;; turn on eldoc mode on the current buffer
(add-hook 'nrepl-interaction-mode-hook
  'nrepl-turn-on-eldoc-mode)

;; if nil, Stop the error buffer from popping up while working in the REPL buffer
(setq nrepl-popup-stacktraces t)
(add-hook 'nrepl-mode-hook 'lisp-shared-hook)

;; ritz-nrepl
(add-hook 'nrepl-interaction-mode-hook 'my-nrepl-mode-setup)
(defun my-nrepl-mode-setup ()
  (require 'nrepl-ritz))

;; ac-nrepl
 (require 'ac-nrepl)
 (add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
 (add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
 (eval-after-load "auto-complete"
   '(add-to-list 'ac-modes 'nrepl-mode))

(provide 'init-lisps)
