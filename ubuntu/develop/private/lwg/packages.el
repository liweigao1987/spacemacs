;;; packages.el --- lwg layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2020 Sylvain Benner & Contributors
;;
;; Author: liweigao <liweigao@liweigao-taishiji>
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
  '(lsp-ui)
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

(defun lwg/post-init-lsp-ui ()
  (use-package lsp-ui
    :defer t
    :config
    (setq lsp-ui-imenu-window-width 20)
    (setq lsp-ui-imenu-auto-refresh t)))

(defun pop-local-or-global-mark ()
  "Pop to local mark if it exists or to the global mark if it does not."
  (interactive)
  (if (mark t)
      (if (= (point) (mark t))
          (progn
            (message "--->switch global")
            (pop-global-mark))
        (progn
          (message "---> pop local")
          (pop-to-mark-command)))
    (progn
      (message "---> pop global")
      (pop-global-mark))))

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
    (copy-to-register ?0 $p1 $p2)))

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
  (define-key evil-insert-state-map (kbd "C-p") 'lwg-paste-from-register-0))

(eval-after-load "meghanada"
  '(progn
     (message "---> lwg meghanada")
     (add-hook 'meghanada-mode-hook 'xref-etags-mode)
     (define-key meghanada-mode-map (kbd "<f5>") 'meghanada-jump-declaration)))

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


(defun lwg-treemacs-mark-unmark-path-easy ()
  (interactive)
  (if (equal major-mode 'treemacs-mode)
      (progn
        (treemacs-mark-or-unmark-path-at-point)
        (call-interactively #'treemacs-next-line))
    (message "not in treemacs mode!")))

;;; packages.el ends here
