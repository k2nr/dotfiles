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

(global-set-key "\C-a" 'beginning-of-indented-line)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key (kbd "H-<") 'beginning-of-buffer)
(global-set-key (kbd "H->") 'end-of-buffer)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key "\C-t" 'other-window)
(global-set-key (kbd "C-c C-e") 'eval-and-replace)
(global-set-key (kbd "C-=") 'indent-region)
(global-set-key (kbd "C-o") 'new-line-below)
(global-set-key (kbd "M-o") 'new-line-above)
(global-set-key (kbd "C-M-k") 'kill-and-retry-line)
(global-set-key (kbd "M-w") 'save-region-or-current-line)
(global-set-key (kbd "C-w") 'kill-region-or-backward-kill-word)
(global-set-key (kbd "M-d") 'kill-word-or-delete-horizontal-space)
(global-set-key (kbd "s-d") 'duplicate-current-line-or-region)
(global-set-key (kbd "C-, o") 'open-with-buffer-file)
(global-set-key (kbd "C-, l") 'toggle-truncate-lines)
(global-set-key (kbd "C-, f") 'ns-toggle-fullscreen)
(global-set-key (kbd "C-, d") 'dired-at-point)
(global-set-key (kbd "C-, t") 'twit)
(global-set-key (kbd "C-, g") 'projectile-grep)
;; multi-term
(global-set-key (kbd "C-, z") 'multi-term)

;; helm
(global-set-key (kbd "C-; C-;") 'helm-mini)
(global-set-key (kbd "C-; C-o") 'helm-occur)
(global-set-key (kbd "C-; C-f") 'helm-find-files)
(global-set-key (kbd "C-; C-x") 'helm-M-x)
(global-set-key (kbd "C-; C-l") 'helm-locate)
(global-set-key (kbd "C-; C-b") 'helm-buffers-list)
(global-set-key (kbd "C-; C-p") 'helm-projectile)
(global-set-key (kbd "C-; C-i") 'helm-imenu)
(global-set-key (kbd "C-; C-s") 'helm-c-yas-complete)
(global-set-key (kbd "C-; C-y") 'helm-show-kill-ring)
(define-key helm-map (kbd "C-w") 'backward-kill-word)

;; expand-region
(global-set-key (kbd "C-'") 'er/expand-region)

;; multiple-cursor
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "M->") 'mc/mark-all-symbols-like-this-in-defun)

;; ace-jump-mode
(global-set-key (kbd "C-0") 'ace-jump-line-mode)
;; Move windows, even in org-mode

;; use shift + arrow keys to switch between visible buffers
(require 'windmove)
(windmove-default-keybindings)
(when (eq system-type 'darwin)
  ;; Alternate Mac's command key and Alt key
  (setq ns-command-modifier (quote meta))
  (setq ns-alternate-modifier (quote super))
  (setq ns-right-command-modifier (quote hyper))
  ;; prevent passing keys to system
  (setq mac-pass-control-to-system nil)
  (setq mac-pass-command-to-system nil)
  (setq mac-pass-option-to-system nil)
  )

(provide 'global-keys)
