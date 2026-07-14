(defun my/pbcopy (text &optional _push)
  "Copy TEXT to the macOS clipboard."
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" nil "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(defun my/pbpaste ()
  "Return text from the macOS clipboard."
  (string-trim-right
   (shell-command-to-string "pbpaste")))

(setq interprogram-cut-function   #'my/pbcopy)
(setq interprogram-paste-function #'my/pbpaste)

(setq select-enable-clipboard t) ; 與系統剪貼簿同步.
;; (setq select-enable-primary t) ; 在 Linux/X11 中，通常有兩種「剪貼簿」： 1. PRIMARY (只要選取文字，就會自動放進，不需要Ctrl+C)  2. CLIPBOARD.  Note: macOS沒有Primary Selection的概念，所以加了也是沒用

(provide 'init-clipboard)
