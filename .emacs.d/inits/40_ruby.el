(require 'rinari)
(global-rinari-mode +1)

(require 'rvm)
(rvm-use-default) ;; use rvm's default ruby for the current Emacs session

(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
