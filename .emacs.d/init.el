;; Load Path
(let ((default-directory (expand-file-name "~/.emacs.d/site-lisp")))
  (add-to-list 'load-path default-directory)

  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

;; cask
(require 'cask "~/.cask/cask.el")
(defconst cask-bundle (cask-initialize))

;; start server
(if window-system (server-start))

;; init loader
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")

(custom-set-faces
 '(helm-selection ((t (:background "dark slate gray" :underline t)))))
