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
            (define-key map (kbd "<f9>") 'ff-find-other-file)
            map))

(add-hook 'c-mode-hook 'lwg-mode)
(add-hook 'c-mode-hook 'semantic-mode)
(setq auto-mode-alist
      (append
       '(("\\.mak\\'" . makefile-mode))
       auto-mode-alist))
(message "---> load lwg-mode")
(provide 'lwg-mode)

