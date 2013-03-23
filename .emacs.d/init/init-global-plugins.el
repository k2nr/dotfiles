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

;; yasnippet
(require 'yasnippet)
(require 'dropdown-list)
(setq yas-trigger-key "C-.")
(yas-global-mode 1)
(yas-load-directory "~/.emacs.d/snippets")
(setq yas/prompt-functions '(yas-dropdown-prompt
                             yas-ido-prompt
                             yas-completing-prompt))
;; auto-complete
(require 'auto-complete-config)
(ac-config-default)
(setq-default ac-sources (append '(ac-source-yasnippet) ac-sources))
(setq ac-auto-show-menu 0.2)

;; flymake
(require 'flymake)
(require 'flymake-cursor)
(setq flymake-gui-warnings-enabled nil)
(add-hook 'find-file-hook 'flymake-find-file-hook)

;; projectile
(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-project-root-files '("project.clj" ".git" ".hg" ".bzr" "_darcs" ".projectile" "Makefile"))
(setq projectile-ignored-files '("TAGS" ".DS_Store"))
(setq projectile-ignored-file-extensions '("class" "o" "so" "elc" "jar" "a" "lib"))
(setq projectile-ignored-directories '(".idea" ".git" "Music" "Movies" "Documents" "Desktop" "Pictures"))

;; helm
(require 'helm-config)
(require 'helm-gtags)
(require 'helm-c-yasnippet)
(require 'helm-projectile)
(setq helm-c-yas-space-match-any-greedy t)
(setq recentf-max-saved-items 1000)
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
     (slime-setup '(slime-fancy slime-asdf slime-banner))
     (setq slime-complete-symbol*-fancy t)
     (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)))
(add-hook 'slime-repl-mode-hook 'turn-on-paredit)

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

(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)

;; popwin.el
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

;; windows.el
(setq win:switch-prefix "\C-z")
(define-key global-map win:switch-prefix nil)
(define-key global-map (kbd "C-z 1") 'win-switch-to-window)
(require 'windows)
(setq win:use-frame nil)
(win:startup-with-window)
(define-key ctl-x-map "C" 'see-you-again)
(define-key win:switch-map "\C-m" 'win-menu)
(define-key win:switch-map ";" 'win-switch-menu)

;; magit
(require 'magit)

;; zencoding
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)
(add-hook 'html-mode-hook 'zencoding-mode)

;; jade-mode
(require 'jade-mode)
(require 'sws-mode)
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;; markdown-mode
(require 'markdown-mode)
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))

;; multiple-cursor
(require 'multiple-cursors)

;; expand-region
(require 'expand-region)

(require 'ace-jump-mode)
(defun add-keys-to-ace-jump-mode (prefix c &optional mode)
  (define-key global-map
    (read-kbd-macro (concat prefix (string c)))
    `(lambda ()
       (interactive)
       (funcall (if (eq ',mode 'word)
                    #'ace-jump-word-mode
                  #'ace-jump-char-mode) ,c))))

(loop for c from ?0 to ?9 do (add-keys-to-ace-jump-mode "H-" c 'word))
(loop for c from ?a to ?z do (add-keys-to-ace-jump-mode "H-" c 'word))
(provide 'init-global-plugins)
