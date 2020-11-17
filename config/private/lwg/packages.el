;;; packages.el --- lwg layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author:  <liweigao@9766A7CBF37ECE5>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `lwg-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `lwg/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `lwg/pre-init-PACKAGE' and/or
;;   `lwg/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst lwg-packages
  '()
  "The list of Lisp packages required by the lwg layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun lwg-evil-paste-from-0 ()
  (interactive)
  (let ((evil-this-register ?0))
    (call-interactively 'evil-visual-paste)))

(defun lwg-evil-copy-to-0 ()
  (interactive)
  (let ((evil-this-register ?0))
    (call-interactively 'evil-yank)))

(defun lwg-copy-to-register-0 ()
  "copy current line or text selection to register 0"
  (interactive)
  (let ($p1 $p2)
    (if (region-active-p)
        (progn (setq $p1 (region-beginning))
               (setq $p2 (region-end)))
      (progn (setq $p1 (line-beginning-position))
             (setq $p2 (line-end-position))))
    (copy-to-register ?0 $p1 $p2)
    ))

(defun lwg-paste-from-register-0 ()
  "paste text from register 0"
  (interactive)
  (when (use-region-p)
    (delete-region (region-beginning) (region-end)))
  (insert-register ?0 t))

(with-eval-after-load 'evil
  (define-key evil-insert-state-map (kbd "C-h") 'backward-char)
  (define-key evil-insert-state-map (kbd "C-j") 'next-line)
  (define-key evil-insert-state-map (kbd "C-k") 'previous-line)
  (define-key evil-insert-state-map (kbd "C-l") 'forward-char)
  (define-key evil-insert-state-map (kbd "C-y") 'lwg-copy-to-register-0)
  (define-key evil-insert-state-map (kbd "C-p") 'lwg-paste-from-register-0)
  )

(global-set-key (kbd "<backtab>") 'evil-shift-left)
(defun un-indent-by-removing-4-spaces ()
  "remove 4 spaces from beginning of of line"
  (interactive)
  (save-excursion
    (save-match-data
      (beginning-of-line)
      ;; get rid of tabs at beginning of line
      (when (looking-at "^\\s-+")
        (untabify (match-beginning 0) (match-end 0)))
      (when (looking-at (concat "^" (make-string tab-width ?\ )))
        (replace-match "")))))

;; (define-key evil-normal-state-map (kbd "<C-tab>") 'buffer-switch)
;; ;; keymap used in the popup menu
;; (setq switch-keymap (make-sparse-keymap))
;; (define-key switch-keymap (kbd "<tab>") 'popup-next)
;; (define-key switch-keymap (kbd "j") 'popup-next)
;; (define-key switch-keymap (kbd "k") 'popup-previous)
;; (define-key switch-keymap (kbd "<return>") 'popup-select)
;; (setq buffer-switch-max 5)

;; (defun buffer-switch ()
;;   (interactive)
;;   ;; all the buffers
;;   (setq full-buffer-list (mapcar (function buffer-name) (buffer-list)))
;;   (if buffer-switch-max
;;       (progn
;;         ;; if max specified, only take n buffers
;;         (setq buffer-select-list (subseq full-buffer-list 0 (- buffer-switch-max 1)))
;;         )
;;     ;; if not specified, take all
;;     (setq buffer-select-list full-buffer-list)
;;     )
;;   (setq dest-buffer (popup-menu* buffer-select-list :keymap switch-keymap))
;;   (switch-to-buffer dest-buffer)
;;   )

;;; packages.el ends here
