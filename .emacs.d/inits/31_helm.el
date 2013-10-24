;; helm
(require 'helm)
(require 'helm-config)
(require 'helm-gtags)
(require 'helm-c-yasnippet)
(require 'helm-projectile)

(setq helm-c-yas-space-match-any-greedy t)
(setq recentf-max-saved-items 1000)

(define-key helm-map (kbd "C-w") 'backward-kill-word)
