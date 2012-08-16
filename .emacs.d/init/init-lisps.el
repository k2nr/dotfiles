(require 'shared-funs)

(defface esk-paren-face
   '((((class color) (background dark))
      (:foreground "grey50"))
     (((class color) (background light))
      (:foreground "grey55")))
   "Face used to dim parentheses."
   :group 'starter-kit-faces)

;; common lisp
(add-hook 'lisp-mode-hook 'turn-on-paredit)
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
(add-hook 'emacs-lisp-mode-hook 'turn-on-paredit)

(font-lock-add-keywords 'emacs-lisp-mode
                        '(("(\\|)" . 'esk-paren-face)))

;; scheme
(add-hook 'scheme-mode-hook 'turn-on-paredit)
;(add-hook 'scheme-mode-hook 'idle-highlight)
(font-lock-add-keywords 'scheme-mode
                        '(("(\\|)" . 'esk-paren-face)))

;; clojure
(require 'clojure-mode)
(add-hook 'clojure-mode-hook 'turn-on-paredit)
(font-lock-add-keywords 'clojure-mode
                        '(("(\\|)" . 'esk-paren-face)))

(provide 'init-lisps)
