;; flymake
(require 'flymake)
(require 'flymake-cursor)
(setq flymake-gui-warnings-enabled nil)
(add-hook 'find-file-hook 'flymake-find-file-hook)

(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
