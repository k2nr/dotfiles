;; Load Path
(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/init"))

(require 'init-exec-path)
(require 'init-coding-system)
(require 'init-global-plugins)
(require 'init-visual)

;; y or p instead of yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; Default Working Directory
(setq default-directory "~/")

;; No Backup Files
(setq backup-inhibited t)
(setq delete-auto-save-files t)

;; Clean Startup
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")

;; cua-mode
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; C-k to kill whole line
(setq kill-whole-line t)

;; default indent settings
(setq-default indent-tabs-mode nil)
(custom-set-variables '(tab-width 4))

;; start server
(if window-system (server-start))

;; language settings
(require 'init-lisps)

;; Keys
(require 'global-keys)
