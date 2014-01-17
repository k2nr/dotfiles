(evil-define-key 'normal global-map (kbd "gh") (kbd "^"))
(evil-define-key 'normal global-map (kbd "gl") (kbd "$"))
(evil-define-key 'normal global-map (kbd "gp") (kbd "o <escape> p"))

(evil-define-key 'normal global-map (kbd "t") 'projectile-find-file)
(evil-define-key 'normal global-map (kbd ", z") 'multi-term)
(evil-define-key 'normal global-map (kbd ", g") 'magit-status)


;; helm
(define-key evil-normal-state-map (kbd "; ;") 'helm-mini)
(define-key evil-normal-state-map (kbd "; f") 'helm-find-files)
(define-key evil-normal-state-map (kbd "; b") 'helm-buffers-list)
(define-key evil-normal-state-map (kbd "; p") 'helm-projectile)
(define-key evil-normal-state-map (kbd "; o") 'helm-occur)
(define-key evil-normal-state-map (kbd "; l") 'helm-locate)
(define-key evil-normal-state-map (kbd "; i") 'helm-imenu)
(define-key evil-normal-state-map (kbd "; x") 'helm-M-x)

(define-key evil-normal-state-map (kbd "\"") 'er/expand-region)
