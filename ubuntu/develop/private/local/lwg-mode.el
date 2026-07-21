(make-variable-buffer-local
 (defvar lwg-print-count 0
   "print counts"))

(defun print-lwg ()
  (interactive)
  (setq lwg-print-count (1+ lwg-print-count))
  (message "---> lwg-mode: %d" lwg-print-count))

;; 本地标记环前跳：与原生 pop-to-mark-command 方向完全相反
(defun mark-ring-forward ()
  "向前遍历当前缓冲区的标记环，与 `pop-to-mark-command' 反向。
后跳快捷键：C-u C-SPC（原生自带）
前跳快捷键：C-u C-S-SPC（本配置新增）"
  (interactive)
  (if (null mark-ring)
      (message "标记环为空，无法前跳")
    (let ((next-mark (car (last mark-ring))))
      ;; 将当前标记压入环首，移除环尾标记并跳转
      (setq mark-ring (cons (copy-marker (mark-marker))
                            (butlast mark-ring)))
      (set-marker (mark-marker) next-mark)
      (goto-char next-mark)
      (message "前跳至标记位置"))))

;; 全局标记环前跳：与原生 pop-global-mark 方向相反（支持跨文件）
(defun global-mark-ring-forward ()
  "向前遍历全局标记环，与 `pop-global-mark' 方向完全互逆。
后跳命令：pop-global-mark（原生快捷键 C-x C-SPC）"
  (interactive)
  ;; 清理末尾指向已不存在缓冲区的无效标记（与原生清理开头对应）
  (while (and global-mark-ring
              (not (marker-buffer (car (last global-mark-ring)))))
    (setq global-mark-ring (butlast global-mark-ring)))
  
  (or global-mark-ring
      (error "No global mark set"))
  
  (let* ((marker (car (last global-mark-ring)))
         (buffer (marker-buffer marker))
         (position (marker-position marker)))
    ;; 反向旋转：将环尾标记移到环首，与原生「环首移到环尾」完全对称
    (setq global-mark-ring (cons marker (butlast global-mark-ring)))
    
    (set-buffer buffer)
    ;; 校验标记位置是否在缓冲区可见范围内，支持自动widen
    (or (and (>= position (point-min))
             (<= position (point-max)))
        (if widen-automatically
            (widen)
          (error "Global mark position is outside accessible part of buffer %s"
                 (buffer-name buffer))))
    
    (goto-char position)
    (switch-to-buffer buffer)))

(define-minor-mode lwg-mode
  "lwg minor mode"
  :lighter " lwg"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "<f8>") 'print-lwg)
            (define-key map (kbd "<f9>") 'ff-find-other-file)
            (define-key map (kbd "M-n") 'mark-ring-forward)
            (define-key map (kbd "M-p") 'pop-to-mark-command)
            ;; 清除 M-N → M-n 的自动翻译规则
            ;; (define-key key-translation-map (kbd "M-N") nil)
            ;; (define-key map (kbd "M-N") 'global-mark-ring-forward)
            ;; (define-key key-translation-map (kbd "M-P") nil)
            ;; (define-key map (kbd "M-P") 'pop-global-mark)
            map))

(add-hook 'c-mode-hook 'lwg-mode)
(add-hook 'c-mode-hook 'semantic-mode)
(setq auto-mode-alist
      (append
       '(("\\.mak\\'" . makefile-mode))
       auto-mode-alist))
(message "---> load lwg-mode")
(provide 'lwg-mode)

