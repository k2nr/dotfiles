(define-key evil-motion-state-map (kbd "gh") 'beginning-of-line)
(define-key evil-motion-state-map (kbd "gl") 'end-of-line)
(define-key evil-normal-state-map (kbd "M-t")'other-window)

;; helm
(define-key evil-normal-state-map (kbd ";;") 'helm-mini)
(define-key evil-normal-state-map (kbd ";f") 'helm-find-files)
(define-key evil-normal-state-map (kbd ";b") 'helm-buffers-list)
(define-key evil-normal-state-map (kbd ";p") 'helm-projectile)
(define-key evil-normal-state-map (kbd ";o") 'helm-occur)
(define-key evil-normal-state-map (kbd ";l") 'helm-locate)
(define-key evil-normal-state-map (kbd ";i") 'helm-imenu)
(define-key evil-normal-state-map (kbd ";x") 'helm-M-x)

(define-key evil-normal-state-map (kbd "\"") 'er/expand-region)