(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . markdown-mode)
  :hook
  (
   (markdown-mode . markdown-display-inline-images) ; 也可以不加然後手動執行.  `M-x markdown-display-inline-images`.
   )
  ;; Note: `M-x markdown-toggle-inline-images` 可以切換開啟或關閉圖片顯示

  )

(provide 'plugin/markdown-mode/markdown-mode-config)
