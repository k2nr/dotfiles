(require 'magit)

(defun magit-fullscreen-advice (orig-func &rest args)
  (elscreen-clone)
  (apply orig-func args)
  (delete-other-windows))

(advice-add 'magit-status :around 'magit-fullscreen-advice)
(advice-add 'magit-log-current :around 'magit-fullscreen-advice)

(defun my/magit-quit ()
  (interactive)
  (magit-mode-bury-buffer)
  (elscreen-kill))

(defun magit-toggle-whitespace ()
  (interactive)
  (if (member "-w" magit-diff-options)
      (magit-dont-ignore-whitespace)
    (magit-ignore-whitespace)))

(defun magit-ignore-whitespace ()
  (interactive)
  (add-to-list 'magit-diff-options "-w")
  (magit-refresh))

(defun magit-dont-ignore-whitespace ()
  (interactive)
  (setq magit-diff-options (remove "-w" magit-diff-options))
  (magit-refresh))

;;;;;;;;;;;;;;;;;;;
;; evil key bindings
;;;;;;;;;;;;;;;;;;;

;(evil-set-initial-state 'magit-log-edit-mode 'insert)
;(evil-set-initial-state 'git-commit-mode 'insert)
;(evil-set-initial-state 'magit-commit-mode 'motion)
;(evil-set-initial-state 'magit-status-mode 'motion)
;(evil-set-initial-state 'magit-log-mode 'motion)
;(evil-set-initial-state 'magit-wassup-mode 'motion)
;(evil-set-initial-state 'magit-mode 'motion)
;(evil-set-initial-state 'git-rebase-mode 'motion)

(dolist (map (list
              ;; Mode maps
              magit-blame-mode-map
              magit-cherry-mode-map
              magit-diff-mode-map
              magit-log-mode-map
              magit-log-select-mode-map
              magit-mode-map
              ;; No evil keys for the popup.
              ;; magit-popup-help-mode-map
              ;; magit-popup-mode-map
              ;; magit-popup-sequence-mode-map
              magit-process-mode-map
              magit-reflog-mode-map
              magit-refs-mode-map
              magit-revision-mode-map
              magit-stash-mode-map
              magit-stashes-mode-map
              magit-status-mode-map
              ;; Section submaps
              magit-branch-section-map
              magit-commit-section-map
              magit-file-section-map
              magit-hunk-section-map
              magit-module-commit-section-map
              magit-remote-section-map
              magit-staged-section-map
              magit-stash-section-map
              magit-stashes-section-map
              magit-tag-section-map
              magit-unpulled-section-map
              magit-unpushed-section-map
              magit-unstaged-section-map
              magit-untracked-section-map))
  ;; Move current bindings for movement keys to their upper-case counterparts.
  (dolist (key (list "k" "j" "h" "l"))
    (let ((binding (lookup-key map key)))
      (when binding
        (define-key map (upcase key) binding) (define-key map key nil))))
  (evil-add-hjkl-bindings map 'emacs
    (kbd "v") 'evil-visual-char
    (kbd "V") 'evil-visual-line
    (kbd "C-v") 'evil-visual-block
    (kbd "C-w") 'evil-window-map))

(dolist (mode (list 'magit-blame-mode
                    'magit-cherry-mode
                    'magit-diff-mode
                    'magit-log-mode
                    'magit-log-select-mode
                    'magit-mode
                    'magit-popup-help-mode
                    'magit-popup-mode
                    'magit-popup-sequence-mode
                    'magit-process-mode
                    'magit-reflog-mode
                    'magit-refs-mode
                    'magit-revision-mode
                    'magit-stash-mode
                    'magit-stashes-mode
                    'magit-status-mode))
  (add-to-list 'evil-emacs-state-modes mode))

(evil-define-key 'motion git-rebase-mode-map
  "c" 'git-rebase-pick
  "r" 'git-rebase-reword
  "s" 'git-rebase-squash
  "e" 'git-rebase-edit
  "f" 'git-rebase-fixup
  "y" 'git-rebase-insert
  "d" 'git-rebase-kill-line
  "u" 'git-rebase-undo
  "x" 'git-rebase-exec
  (kbd "<return>") 'git-rebase-show-commit
  "\M-n" 'git-rebase-move-line-down
  "\M-p" 'git-rebase-move-line-up)

(evil-define-key 'motion magit-commit-mode-map
  "\C-c\C-b" 'magit-show-commit-backward
  "\C-c\C-f" 'magit-show-commit-forward)

(evil-define-key 'emacs magit-log-mode-map
  "Y" 'magit-rebase-interactive)

(evil-define-key 'emacs magit-mode-map
  "Q" 'my/magit-quit)
