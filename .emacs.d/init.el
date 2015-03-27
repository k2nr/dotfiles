;; Load Path
(let ((default-directory (expand-file-name "~/.emacs.d/site-lisp")))
  (add-to-list 'load-path default-directory)

  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

;; cask
(require 'cask (cond
                 ((file-exists-p "~/.cask/cask.el")
                  "~/.cask/cask.el")
                 ((file-exists-p "/usr/local/share/emacs/site-lisp/cask.el")
                  "/usr/local/share/emacs/site-lisp/cask.el")
                 ((file-exists-p "/usr/share/emacs/site-lisp/cask.el")
                  "/usr/share/emacs/site-lisp/cask.el")))
(defconst cask-bundle (cask-initialize))

;; start server
(if window-system (server-start))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-selection ((t (:background "dark slate gray" :underline t)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "6fe6ab4abe97a4f13533e47ae59fbba7f2919583f9162b440dd06707b01f7794" "025354235e98db5e7fd9c1a74622ff53ad31b7bde537d290ff68d85665213d85" default)))
 '(helm-ff-auto-update-initial-value nil)
 '(tab-width 2))

(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")
