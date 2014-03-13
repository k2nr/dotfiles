(require 'flycheck)
(require 'flycheck-haskell)

(setq flycheck-check-syntax-automatically '(mode-enabled save))
(add-hook 'after-init-hook #'global-flycheck-mode)
