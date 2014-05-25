;; helm
(require 'helm)
(require 'helm-config)
(require 'helm-gtags)
(require 'helm-c-yasnippet)
(require 'helm-projectile)
(require 'helm-ag)

(setq helm-c-yas-space-match-any-greedy t)
(setq recentf-max-saved-items 1000)

(define-key helm-map (kbd "C-w") 'backward-kill-word)
;; disable auto completion
(custom-set-variables '(helm-ff-auto-update-initial-value nil))
;; C-h to backspace
(define-key helm-c-read-file-map (kbd "C-h") 'delete-backward-char)
;; completion by TAB
(define-key helm-c-read-file-map (kbd "TAB") 'helm-execute-persistent-action)

;; helm-ag
(setq helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
(setq helm-ag-command-option "--all-text")
(setq helm-ag-thing-at-point 'symbol)
