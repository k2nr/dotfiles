;; Load Path
(let ((default-directory (expand-file-name "~/.emacs.d/site-lisp")))
  (add-to-list 'load-path default-directory)

  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; y or p instead of yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; Default Working Directory
(setq default-directory "~/")

;; No Backup Files
(setq backup-inhibited t)
(setq make-backup-files nil)
(setq delete-auto-save-files t)
(setq auto-save-default nil)

;; Clean Startup
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")

;; cua-mode
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; C-k to kill whole line
(setq kill-whole-line t)

;; no beep
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; default indent settings
(setq-default indent-tabs-mode nil)

;; start server
(if window-system (server-start))

;; delete unnecessary white spaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tab-width 2))

;; save buffer even if the buffer is unchanged
(defadvice save-buffer (before save-buffer-always activate)
  "always save buffer"
  (set-buffer-modified-p t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-selection ((t (:background "dark slate gray" :underline t)))))

(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")
