(defun my-term-handle-exit (process event)
  "在:term之中輸入exit時，可以直接將buffer刪除"
  (when (memq (process-status process) '(exit signal))
    (kill-buffer (process-buffer process))))

(add-hook 'term-exec-hook
          (lambda ()
            (set-process-sentinel
             (get-buffer-process (current-buffer))
             #'my-term-handle-exit)))

(provide 'config/hook)
