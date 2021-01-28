(make-variable-buffer-local
 (defvar lwg-print-count 0
   "print counts"))

(defun print-lwg ()
  (interactive)
  (setq lwg-print-count (1+ lwg-print-count))
  (message "---> lwg-mode: %d" lwg-print-count))

(define-minor-mode lwg-mode
  "lwg minor mode"
  :lighter " lwg"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "<f8>") 'print-lwg)
            map))

(add-hook 'c-mode-hook 'lwg-mode)
(message "---> load lwg-mode")
(provide 'lwg-mode)

