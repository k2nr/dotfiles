;; auto-complete
(require 'auto-complete-config)
(ac-config-default)
(setq-default ac-sources (append '(ac-source-yasnippet) ac-sources))
(setq ac-auto-show-menu 0.2)
(setq ac-use-fuzzy t)

(define-key ac-complete-mode-map (kbd "C-n") 'ac-next)
(define-key ac-complete-mode-map (kbd "C-p") 'ac-previous)
(define-key ac-completing-map (kbd "<tab>") 'ac-complete)
(define-key ac-completing-map (kbd "RET") nil)
