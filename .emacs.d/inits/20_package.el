(require 'package)
; Add package-archives
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(require 'melpa)

;;;;;;;;;;;;;;;;;;;;;;;;
;; el-get
;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/el-get/el-get/")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(require 'el-get)

;;; define el-get repository
;(setq el-get-sources
;      '((:name evil-rails
;         :type github
;         :description "rails.vim clone for Emacs"
;         :pkgname "antono/evil-rails")
;        ))
;
;; auto install el-get.el
;(defvar my-el-get-packages
;  '(evil-rails
;    )
;  "A list of packages to install from el-get at launch.")
;
;(el-get 'sync my-el-get-packages)
;(add-to-list 'load-path "~/.emacs.d/el-get/")
;(normal-top-level-add-subdirs-to-load-path)
