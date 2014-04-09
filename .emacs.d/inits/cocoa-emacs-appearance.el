;; Font
(when (eq window-system 'ns)
  (create-fontset-from-ascii-font "Inconsolata-14:weight=normal:slant=normal" nil "ricty")
  (set-fontset-font "fontset-ricty"
                    'unicode
                    (font-spec :family "Ricty" :size 14)
                    nil
                    'append)
  (add-to-list 'default-frame-alist '(font . "fontset-ricty"))
                                        ;(set-frame-parameter (selected-frame) 'alpha '(0.95))
  (set-frame-size (selected-frame) 120 50)
  (tool-bar-mode 0)
  (scroll-bar-mode 0))

;; Theme
(load-theme 'solarized-dark t)
;(load-theme 'zenburn t)
