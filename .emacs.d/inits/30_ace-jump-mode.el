(require 'ace-jump-mode)
(defun add-keys-to-ace-jump-mode (prefix c &optional mode)
  (define-key global-map
    (read-kbd-macro (concat prefix (string c)))
    `(lambda ()
       (interactive)
       (funcall (if (eq ',mode 'word)
                    #'ace-jump-word-mode
                  #'ace-jump-char-mode) ,c))))

(loop for c from ?0 to ?9 do (add-keys-to-ace-jump-mode "H-" c 'word))
(loop for c from ?a to ?z do (add-keys-to-ace-jump-mode "H-" c 'word))
