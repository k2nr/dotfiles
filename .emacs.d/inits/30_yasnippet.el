;; yasnippet
(require 'yasnippet)
(setq yas-trigger-key "C-.")
(yas-global-mode 1)
(yas-load-directory "~/.emacs.d/snippets")
(setq yas/prompt-functions '(yas-dropdown-prompt
                             yas-ido-prompt
                             yas-completing-prompt))
