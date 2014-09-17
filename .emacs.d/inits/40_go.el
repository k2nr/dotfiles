(require 'go-autocomplete)

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "M-.") 'godef-jump)))

(setq gofmt-command "goimports")
(add-hook 'before-save-hook #'gofmt-before-save)
