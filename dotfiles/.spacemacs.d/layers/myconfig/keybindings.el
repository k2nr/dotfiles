
(global-set-key (kbd "C-h") 'delete-backward-char)
(add-hook
  'term-mode-hook
  '(lambda ()
     (define-key term-raw-map "\C-h" 'term-send-backspace)))

(evil-define-key 'normal global-map (kbd "gh") (kbd "^"))
(evil-define-key 'normal global-map (kbd "gl") (kbd "$"))
(evil-define-key 'normal global-map (kbd "gp") (kbd "o <escape> p"))
(define-key evil-normal-state-map (kbd "; ;") 'helm-mini)
(define-key evil-normal-state-map (kbd "; f") 'helm-find-files)
(define-key evil-normal-state-map (kbd "; b") 'helm-buffers-list)
(define-key evil-normal-state-map (kbd "; p") 'helm-projectile)
(evil-define-key 'normal global-map (kbd "t") 'helm-projectile-find-file)
(define-key evil-normal-state-map (kbd "; o") 'helm-swoop)
(define-key evil-normal-state-map (kbd "; l") 'helm-locate)
(define-key evil-normal-state-map (kbd "; i") 'helm-imenu)
(define-key evil-normal-state-map (kbd "; x") 'helm-M-x)
(define-key evil-normal-state-map (kbd "; a") 'helm-projectile-ag)
;(define-key helm-map (kbd "C-h") 'delete-backward-char)
(evil-define-key 'normal global-map (kbd "f") 'avy-goto-word-or-subword-1)
