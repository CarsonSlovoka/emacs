;; 這似乎沒有，先直接用: `markdown-max-image-size '(800 . nil)` 效果也不差
;;(defun my-markdown-set-image-size ()
;;  "將 Markdown 圖片最大寬度設為目前視窗的 50%。"
;;  (setq-local
;;   markdown-max-image-size
;;   (cons (floor (* 0.5 (window-body-width nil t)))
;;         nil)))


(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . markdown-mode)

  :custom
  (markdown-max-image-size '(800 . nil)) ; 寬度最大800, 高度會自動依比率縮放.
  ;; Note: `:(image-transforms-p)` 如果有顯示，例如: (scale rotate90) 就表示frame能夠處理縮放. 若不支持才有可能走ImageMagick的版本.
  ;; 縮圖存在哪？
  ;; 原始圖片：硬碟
  ;; 解碼及縮放結果：Emacs 記憶體
  ;; 永久縮圖檔：沒有

  :hook
  (
   ;; (markdown-mode . my-markdown-set-image-size)  ; ~~自定義最大圖片尺吋. Warn: 如果調整了需要再執行: `M-x markdown-display-inline-images` 已經呈現的圖片才會再調整~~ 這好像沒用
   (markdown-mode . markdown-display-inline-images) ; 也可以不加然後手動執行.  `M-x markdown-display-inline-images`.
   )
  ;; Note: `M-x markdown-toggle-inline-images` 可以切換開啟或關閉圖片顯示

  )

(provide 'plugin/markdown-mode/markdown-mode-config)
