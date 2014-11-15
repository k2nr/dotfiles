;; indent
(dolist (spec '(("\\.rb$"          . ruby-mode)
                ("[vV]agrantfile$" . ruby-mode)
                ("[gG]emfile$"     . ruby-mode)
                ("\\.rake$"        . ruby-mode)
                ("\\.rabl$"        . ruby-mode)
                ("[cC]apfile$"     . ruby-mode)
                ("\\.gemspec$"     . ruby-mode)
                ("\\.builder$"     . ruby-mode)))
  (add-to-list 'auto-mode-alist spec))

(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rbenv-use-corresponding))

;; robe
(add-hook 'ruby-mode-hook 'robe-mode)
;(add-hook 'robe-mode-hook 'ac-robe-setup)

;; inf-ruby
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
(setq inf-ruby-default-implementation "pry")

;; rinari
(defvar my-rinari-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "m") 'rinari-find-model)
    (define-key map (kbd "v") 'rinari-find-view)
    (define-key map (kbd "c") 'rinari-find-controller)
    (define-key map (kbd "r") 'rinari-find-routes)
    (define-key map (kbd "t") 'rinari-find-test)
    (define-key map (kbd "s") 'rinari-find-rspec)
    map))
(add-hook 'ruby-mode-hook (lambda ()
                              (evil-define-key 'normal rinari-minor-mode-map (kbd ", r") my-rinari-map)))
(global-rinari-mode +1)

(setq ruby-deep-indent-paren-style nil)
(setq ruby-insert-encoding-magic-comment nil)

(modify-syntax-entry ?_ "w" ruby-mode-syntax-table)
