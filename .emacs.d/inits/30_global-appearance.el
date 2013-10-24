;; Show full path on title bar
(setq frame-title-format
      (format  "%%f - Emacs@%s" (system-name)))

;; show line num
;(global-linum-mode t)

;; Highlight Mathced Paren
(show-paren-mode 1)

;; Set background color of current line.
(global-hl-line-mode 1)
;(set-face-background 'hl-line "oldlace")

;; Theme
(load-theme 'solarized-light t)
;(load-theme 'zenburn t)
