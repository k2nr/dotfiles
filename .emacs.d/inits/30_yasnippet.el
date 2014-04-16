;; yasnippet
(require 'yasnippet)
(setq yas-trigger-key "C-.")
(yas-global-mode 1)
(yas-load-directory "~/.emacs.d/snippets")
(yas-load-directory (concat (cask-dependency-path cask-bundle 'yasnippet)
                            "/snippets"))
(setq yas/prompt-functions '(yas-dropdown-prompt
                             yas-ido-prompt
                             yas-completing-prompt))

(cask-dependency-path cask-bundle 'yasnippet)
