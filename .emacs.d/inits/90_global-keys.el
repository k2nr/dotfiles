(require 'shared-funs)

;; \C-a to move to head of the line skipping indent charcters
(defun beginning-of-indented-line (current-point)
  (interactive "d")
  (if (string-match
       "^[ ¥t]+$"
       (save-excursion
         (buffer-substring-no-properties
          (progn (beginning-of-line) (point))
          current-point)))
      (beginning-of-line)
    (back-to-indentation)))

(defun kill-region-or-backward-kill-word ()
  (interactive)
  (if (region-active-p)
      (kill-region (point) (mark))
    (backward-kill-word 1)))

(defun kill-word-or-delete-horizontal-space (arg)
  (interactive "p")
  (let ((pos (point)))
    (if (and (not (eobp))
             (= (char-syntax (char-after pos)) 32)
             (= (char-syntax (char-after (1+ pos))) 32))
        (prog1 (delete-horizontal-space)
          (unless (memq (char-after pos) '(?( ?) ?{ ?} ?[ ?]))
            (insert " ")))
      (kill-word arg))))

(add-hook 'isearch-mode-hook
 (lambda ()
   "Activate my customized Isearch word yank command."
   (substitute-key-definition 'isearch-yank-word-or-char
                              'my-isearch-yank-word-or-char-from-beginning
                              isearch-mode-map)))

(global-set-key (kbd "C-a") 'beginning-of-indented-line)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "H-<") 'beginning-of-buffer)
(global-set-key (kbd "H->") 'end-of-buffer)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-t") 'other-window)
(global-set-key (kbd "C-c C-e") 'eval-and-replace)
(global-set-key (kbd "C-=") 'indent-region)
(global-set-key (kbd "C-o") 'new-line-below)
(global-set-key (kbd "M-o") 'new-line-above)
(global-set-key (kbd "C-M-k") 'kill-and-retry-line)
(global-set-key (kbd "M-w") 'save-region-or-current-line)
(global-set-key (kbd "M-d") 'kill-word-or-delete-horizontal-space)
(global-set-key (kbd "s-d") 'duplicate-current-line-or-region)
(global-set-key (kbd "C-, o") 'open-with-buffer-file)
(global-set-key (kbd "C-, l") 'toggle-truncate-lines)
(global-set-key (kbd "C-, d") 'dired-at-point)
(global-set-key (kbd "C-, g") 'projectile-grep)
(global-set-key (kbd "C-, f") 'toggle-frame-fullscreen)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(global-set-key [left]  'windmove-left)
(global-set-key [right] 'windmove-right)
(global-set-key [up]    'windmove-up)
(global-set-key [down]  'windmove-down)
(define-key evil-normal-state-map [left] 'windmove-left)
(define-key evil-normal-state-map [right] 'windmove-right)
(define-key evil-normal-state-map [up] 'windmove-up)
(define-key evil-normal-state-map [down] 'windmove-down)
(define-key evil-normal-state-map (kbd "M-.") nil)

;; helm
(global-set-key (kbd "C-; C-;") 'helm-mini)
(global-set-key (kbd "C-; C-o") 'helm-occur)
(global-set-key (kbd "C-; C-f") 'helm-find-files)
(global-set-key (kbd "C-; C-x") 'helm-M-x)
(global-set-key (kbd "C-; C-l") 'helm-locate)
(global-set-key (kbd "C-; C-b") 'helm-buffers-list)
(global-set-key (kbd "C-; C-p") 'helm-projectile-ag)
(global-set-key (kbd "C-; C-i") 'helm-imenu)
(global-set-key (kbd "C-; C-s") 'helm-c-yas-complete)
(global-set-key (kbd "C-; C-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-; C-a") 'helm-ag)

;; expand-region
(global-set-key (kbd "C-'") 'er/expand-region)

;; multiple-cursor
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "M->") 'mc/mark-all-symbols-like-this-in-defun)

;; ace-jump-mode
(global-set-key (kbd "C-0") 'ace-jump-line-mode)
;; ace-window
(define-key evil-normal-state-map (kbd "C-w C-w") 'ace-window)

;;; evil
(define-key evil-normal-state-map [escape] 'keyboard-quit)
;(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

(evil-define-key 'normal global-map (kbd "gh") (kbd "^"))
(evil-define-key 'normal global-map (kbd "gl") (kbd "$"))
(evil-define-key 'normal global-map (kbd "gp") (kbd "o <escape> p"))
;(evil-define-key 'normal global-map (kbd "t") 'projectile-find-file)
(define-key evil-normal-state-map (kbd "\"") 'er/expand-region)

;; helm for evil
(define-key evil-normal-state-map (kbd "; ;") 'helm-mini)
(define-key evil-normal-state-map (kbd "; f") 'helm-find-files)
(define-key evil-normal-state-map (kbd "; b") 'helm-buffers-list)
(define-key evil-normal-state-map (kbd "; p") 'helm-projectile)
(evil-define-key 'normal global-map (kbd "t") 'helm-projectile-find-file)
(define-key evil-normal-state-map (kbd "; o") 'helm-occur)
(define-key evil-normal-state-map (kbd "; l") 'helm-locate)
(define-key evil-normal-state-map (kbd "; i") 'helm-imenu)
(define-key evil-normal-state-map (kbd "; x") 'helm-M-x)
(define-key evil-normal-state-map (kbd "; a") 'helm-ag)

(require 'evil-surround)
(global-evil-surround-mode 1)

(when (eq window-system 'ns)
  ;; Alternate Mac's command key and Alt key
  (setq ns-command-modifier (quote meta))
;  (setq ns-alternate-modifier (quote super))
  (setq ns-right-command-modifier (quote hyper))
  ;; prevent passing keys to system
  (setq mac-pass-control-to-system nil)
  (setq mac-pass-command-to-system nil)
  (setq mac-pass-option-to-system nil)
  )
