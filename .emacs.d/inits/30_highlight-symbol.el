(require 'highlight-symbol)

(setq highlight-symbol-idle-delay 0.5)
(add-hook 'prog-mode-hook 'highlight-symbol-mode)
