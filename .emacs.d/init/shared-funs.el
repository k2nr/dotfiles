(require 'paredit)

(defun paredit-kill-region-or-backward-kill-word ()
  (interactive)
  (if (region-active-p)
      (paredit-kill-region (point) (mark))
    (paredit-backward-kill-word)))

(defun paredit-kill-word-or-delete-horizontal-space (arg)
  (interactive "p")
  (let ((pos (point)))
    (if (and (not (eobp))
             (= (char-syntax (char-after pos)) 32)
             (= (char-syntax (char-after (1+ pos))) 32))
        (prog1 (delete-horizontal-space)
          (unless (memq (char-after pos) '(?( ?) ?{ ?} ?[ ?]))
            (insert " ")))
      (paredit-forward-kill-word))))

(defun turn-on-paredit ()
  (define-key paredit-mode-map (kbd "C-w") 'paredit-kill-region-or-backward-kill-word)
  (define-key paredit-mode-map (kbd "M-d") 'paredit-kill-word-or-delete-horizontal-space)
  (paredit-mode 1))

(defun my-isearch-yank-word-or-char-from-beginning ()
  "Move to beginning of word before yanking word in isearch-mode."
  (interactive)
  ;; Making this work after a search string is entered by user
  ;; is too hard to do, so work only when search string is empty.
  (if (= 0 (length isearch-string))
      (beginning-of-thing 'word))
  (isearch-yank-word-or-char)
  ;; Revert to 'isearch-yank-word-or-char for subsequent calls
  (substitute-key-definition 'my-isearch-yank-word-or-char-from-beginning
                             'isearch-yank-word-or-char
                             isearch-mode-map))

(defun backward-symbol (&optional arg)
  "Move backward until encountering the beginning of a symbol.
With argument, do this that many times."
  (interactive "p")
  (forward-symbol (- (or arg 1))))

(defun backward-same-syntax (&optional arg)
  "Move backward until encountering the beginning of a same-syntax.
With argument, do this that many times."
  (interactive "p")
  (forward-same-syntax (- (or arg 1))))

(defun open-with-buffer-file ()
  "Simple function that allows us to open the underlying
file of a buffer in an external program."
  (interactive)
  (when buffer-file-name
    (shell-command (concat
                    (if (eq system-type 'darwin)
                        "open"
                      (read-shell-command "Open current file with: "))
                    " "
                    buffer-file-name))))

(defun indent-buffer ()
  "Indents the entire buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indents a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indented selected region."))
      (progn
        (prelude-indent-buffer)
        (message "Indented buffer.")))))

(defun new-line-below ()
  (interactive)
  (if (eolp)
      (newline)
    (end-of-line)
    (newline))
  (indent-for-tab-command))

(defun new-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated."
  (interactive "p")
  (save-excursion
    (if (region-active-p)
        (duplicate-region arg)
      (duplicate-current-line arg))))

(defun duplicate-region (num &optional start end)
  "Duplicates the region bounded by START and END NUM times.
If no START and END is provided, the current region-beginning and
region-end is used. Adds the duplicated text to the kill ring."
  (interactive "p")
  (let* ((start (or start (region-beginning)))
         (end (or end (region-end)))
         (region (buffer-substring start end)))
    (kill-ring-save start end)
    (goto-char start)
    (dotimes (i num)
      (insert region))))

(defun duplicate-current-line (num)
  "Duplicate the current line NUM times."
  (interactive "p")
  (when (eq (point-at-eol) (point-max))
    (goto-char (point-max))
    (newline)
    (forward-char -1))
  (duplicate-region num (point-at-bol) (1+ (point-at-eol))))

(defun copy-to-end-of-line ()
  (interactive)
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position 2))
  (message "Copied to end of line"))

(defun copy-whole-lines (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

(defun copy-line (arg)
  "Copy to end of line, or as many lines as prefix argument"
  (interactive "P")
  (if (null arg)
      (copy-to-end-of-line)
    (copy-whole-lines (prefix-numeric-value arg))))

(defun save-region-or-current-line (arg)
  (interactive "P")
  (if (region-active-p)
      (kill-ring-save (region-beginning) (region-end))
    (copy-line arg)))

(defun kill-and-retry-line ()
  "Kill the entire current line and reposition point at indentation"
  (interactive)
  (back-to-indentation)
  (kill-line))

(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(provide 'shared-funs)
