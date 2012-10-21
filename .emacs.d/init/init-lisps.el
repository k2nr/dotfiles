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
  (custom-set-variables '(tab-width 2))
  )

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
(add-hook 'scheme-mode-hook 'lisp-shared-hook)
;(add-hook 'scheme-mode-hook 'idle-highlight)
(font-lock-add-keywords 'scheme-mode
                        '(("(\\|)" . 'esk-paren-face)))

;; clojure
(require 'clojure-mode)
(add-hook 'clojure-mode-hook 'lisp-shared-hook)
(add-hook 'clojure-mode-hook (lambda ()
                               (local-set-key (kbd "C-c C-s") 'clojure-jack-in)
                               ))

(font-lock-add-keywords 'clojure-mode
                        '(("(\\|)" . 'esk-paren-face)))

;; C-c C-z to switch nREPL buffer
(add-to-list 'same-window-buffer-names "*nrepl*")

;; ac-nrepl
 (require 'ac-nrepl)
 (add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
 (add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
 (eval-after-load "auto-complete"
   '(add-to-list 'ac-modes 'nrepl-mode))

(provide 'init-lisps)
