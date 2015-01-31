(set-face-attribute 'default nil :family "Ricty" :height 140)

;; 日本語
(let ((jp-font-spec (font-spec :family "Hiragino Kaku Gothic ProN")))
  (set-fontset-font nil 'japanese-jisx0208 jp-font-spec)
  (set-fontset-font nil 'japanese-jisx0212 jp-font-spec)
  (set-fontset-font nil 'japanese-jisx0213-1 jp-font-spec)
  (set-fontset-font nil 'japanese-jisx0213-2 jp-font-spec))

;(setq face-font-rescale-alist '((".*Hiragino_Kaku_Gothic_ProN.*" . 1.2)))

(set-frame-size (selected-frame) 120 50)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(set-frame-parameter nil 'background-mode 'dark)
(load-theme 'solarized t)
