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

(global-set-key "\C-a" 'beginning-of-indented-line)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-u" 'undo)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key "\C-j" 'join-line)
(global-set-key "\C-t" 'other-window)
(global-set-key (kbd "C-, t") 'toggle-truncate-lines)
(global-set-key (kbd "C-, f") 'ns-toggle-fullscreen)
(global-set-key (kbd "C-, d") 'dired-at-point)

;; multi-term
(global-set-key (kbd "C-, z") 'multi-term)

;; undo-tree
(global-set-key (kbd "C-S-u") 'undo-tree-redo)

;; helm
(global-set-key (kbd "C-; C-;") 'helm-mini)
(global-set-key (kbd "C-; C-o") 'helm-occur)
(global-set-key (kbd "C-; C-f") 'helm-find-files)
(global-set-key (kbd "C-; C-x") 'helm-M-x)
(global-set-key (kbd "C-; C-l") 'helm-locate)
(global-set-key (kbd "C-; C-b") 'helm-buffers-list)
(global-set-key (kbd "C-; C-k") 'helm-show-kill-ring)

(when (eq system-type 'darwin)
  ;; Alternate Mac's command key and Alt key
  (setq ns-command-modifier (quote meta))
  (setq ns-alternate-modifier (quote super))
  ;; prevent passing keys to system
  (setq mac-pass-control-to-system nil)
  (setq mac-pass-command-to-system nil)
  (setq mac-pass-option-to-system nil))

(provide 'global-keys)
