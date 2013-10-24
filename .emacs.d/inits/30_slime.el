;; slime
(autoload 'slime "slime" nil t)
(eval-after-load "slime"
  '(progn
     (setq inferior-lisp-program "ccl64 -K utf-8")
     (setq slime-net-coding-system 'utf-8-unix)
;     (slime-setup '(slime-fancy slime-asdf slime-banner))
;     (setq slime-complete-symbol*-fancy t)
     (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)))
(add-hook 'slime-repl-mode-hook 'turn-on-paredit)
