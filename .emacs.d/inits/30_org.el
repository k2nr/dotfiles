(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(require 'org)
(require 'org-agenda)
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-src-fontify-natively t)
(setq org-agenda-files
      (list "~/Dropbox/org/memo.org"))
(setq org-log-done t)
(setq org-return-follows-link t)

(define-key org-agenda-mode-map "j" 'org-agenda-next-line)
(define-key org-agenda-mode-map "k" 'org-agenda-previous-line)

(setq org-agenda-custom-commands
      '(("w" todo "WAITING" nil)
        ("n" todo "NEXT" nil)
        ("d" "Agenda + Next Actions" ((agenda) (todo "NEXT")))))

(defun my-org-open-at-point()
  (interactive)
  (let ((org-file-apps '(("\\.pdf\\'" . "xournal %s"))))
    (org-open-at-point)))

(defun task ()
   (interactive)
   (find-file "~/Dropbox/org/gtd.org"))

(defun memo ()
   (interactive)
   (find-file "~/Dropbox/org/memo.org"))
