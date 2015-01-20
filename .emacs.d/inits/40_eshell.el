(require 'ansi-color)
(require 'eshell)

(setq eshell-cmpl-ignore-case t)
(setq eshell-hist-ignoredups t)
(setq eshell-ask-to-save-history 'always)
;; (setq eshell-prompt-function 'my-eshell-prompt)

;; (defun my-eshell-prompt ()
;;   (concat (eshell/pwd) "λ "))

(defun my-eshell-setting ()
  (dolist (c '("tig" "sl" "top"))
    (add-to-list 'eshell-visual-commands c)))

(add-hook 'eshell-mode-hook 'my-eshell-setting)
(add-hook 'eshell-mode-hook 'smartparens-mode)

(defun my/eshell-here ()
  "Opens up a new shell in the directory associated with the current buffer's file."
  (interactive)
  (let* ((parent (file-name-directory (buffer-file-name)))
         (name   (car (last (split-string parent "/" t)))))
    (eshell "new")
    (rename-buffer (concat "*eshell: " name "*"))

    (insert (concat "ls"))
    (eshell-send-input)))

(defun eshell/x (&rest args)
  (eshell/exit))
