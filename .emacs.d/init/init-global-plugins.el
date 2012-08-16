;; package
(require 'package)
; Add package-archives
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(require 'melpa)

;; white-space
(require 'whitespace)
(setq whitespace-style '(face tabs tab-mark spaces space-mark))
(setq whitespace-display-mappings
     '((space-mark ?\u3000 [?\u25a1])
       ;; WARNING: the mapping below has a problem.
       ;; When a TAB occupies exactly one column, it will display the
       ;; character ?\xBB at that column followed by a TAB which goes to
       ;; the next TAB column.
       ;; If this is a problem for you, please, comment the line below.
       (tab-mark ?\t [?\xBB ?\t] [?\\ ?\t])))
(setq whitespace-space-regexp "\\(\u3000+\\)")
(global-whitespace-mode 1)


;; auto-complete
(require 'auto-complete-config)
(ac-config-default)
(setq-default ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))

(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)

;; flymake
(require 'flymake)
(require 'flymake-cursor)
(setq flymake-gui-warnings-enabled nil)
(add-hook 'find-file-hook 'flymake-find-file-hook)

;; helm
(require 'helm-config)
(require 'helm-gtags)
(require 'helm-c-yasnippet)
(setq helm-c-yas-space-match-any-greedy t)
;(require 'helm-git)
;(require 'helm-c-moccur)

;; multi-term
(require 'multi-term)
(setq multi-term-program "/usr/local/bin/zsh")
(setenv "TERMINFO" "~/.terminfo")

;; slime
(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/slime-2012-08-11"))
(autoload 'slime "slime" nil t)
(eval-after-load "slime"
  '(progn
     (setq inferior-lisp-program "ccl64 -K utf-8")
     (setq slime-net-coding-system 'utf-8-unix)
     (slime-setup '(slime-fancy))))

;;ac-slime
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

;; twittering-mode
(add-to-list 'load-path "~/.emacs.d/plugins/twittering-mode")
(require 'twittering-mode)
(setq twittering-use-master-password t)
(setq twittering-private-info-file "~/.emacs.d/twittering-mode.gpg")
(setq twittering-status-format "%i @%s %S %p\n%T\n  [%@]%r %R %f\n--------------------------------------------")
(setq twittering-icon-mode t)
(setq twittering-convert-fix-size 30)
(setq twittering-timer-interval 40)
(setq twittering-number-of-tweets-on-retrieval 50)
(add-hook 'twittering-mode-hook
          (lambda ()
            (local-set-key (kbd "o")
               (lambda ()
                 (interactive)
                 (twittering-goto-next-uri)
                 (execute-kbd-macro (kbd "C-m"))
                 ))))

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

;; yasnippet
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/snippets")

;; popwin.el
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)



(provide 'init-global-plugins)
