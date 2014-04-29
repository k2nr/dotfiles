(require 'inf-ruby)
(require 'rinari)
(global-rinari-mode +1)

(require 'rvm)
(rvm-use-default) ;; use rvm's default ruby for the current Emacs session

(dolist (spec '(("\\.rb$"          . ruby-mode)
                ("[vV]agrantfile$" . ruby-mode)
                ("[gG]emfile$"     . ruby-mode)
                ("\\.rake$"        . ruby-mode)
                ("\\.rabl$"        . ruby-mode)
                ("[cC]apfile$"     . ruby-mode)
                ("\\.gemspec$"     . ruby-mode)
                ("\\.builder$"     . ruby-mode)))
  (add-to-list 'auto-mode-alist spec))

;; robe
(require 'robe)
(add-hook 'ruby-mode-hook (lambda (robe-mode)))

;; inf-ruby
(require 'inf-ruby)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)

;; indent
(setq ruby-deep-indent-paren-style nil)

(modify-syntax-entry ?_ "w" ruby-mode-syntax-table)
