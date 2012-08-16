;; Font
(create-fontset-from-ascii-font "Inconsolata-14:weight=normal:slant=normal" nil "ricty")
(set-fontset-font "fontset-ricty"
                  'unicode
                  (font-spec :family "Ricty" :size 14)
                  nil
                  'append)
(add-to-list 'default-frame-alist '(font . "fontset-ricty"))

;; Show full path on title bar
(setq frame-title-format
      (format  "%%f - Emacs@%s" (system-name)))

;; show line num
;(global-linum-mode t)

;; GUI settings
(when (eq window-system 'ns)
  (set-frame-parameter (selected-frame) 'alpha '(0.95))
  (set-frame-size (selected-frame) 90 46)
  (tool-bar-mode 0)
  (scroll-bar-mode 0))

;; CUI Settings
(when (not window-system)
  (menu-bar-mode 0))

;; Highlight Mathced Paren
(show-paren-mode 1)

;; Set background color of current line.
(global-hl-line-mode 1)
;(set-face-background 'hl-line "oldlace")

;; Theme
(load-theme 'solarized-light t)

(provide 'init-visual)
