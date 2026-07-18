(use-package eww
  :ensure nil ; 內建就有的插件
  ;; :custom ; 純設定選項, 變數數值調整之類的
  ;; (eww-search-prefix "https://www.google.com/search?q=") ; 可行，但javascript不能執行。所以還是用預設的 https://duckduckgo.com/html/q=? 會比較隱
  :config ; 執行程式 (有需要執行的都要寫在這)

  ;;; 🟧 keymap
  ;; F1 b 之後找eww-相關
  ;; H   eww-list-histories
  ;; b   eww-add-bookmark
  ;; B   eww-list-bookmarks
  ;; M-n eww-next-bookmark
  ;; M-p eww-previous-bookmark
  ( evil-define-key 'emacs eww-mode-map
    (kbd "[") #'eww-back-url
    (kbd "]") #'eww-forward-url

    ;; <kp-next>
    ;; <kp-prior>
    (kbd "k") #'scroll-down-command
    (kbd "j") #'scroll-up-command
    )

  ( evil-define-key 'normal eww-mode-map
    (kbd "[") #'eww-back-url
    (kbd "]") #'eww-forward-url
    )

  ;; `M-h m` 可以曉得major mode
  ( evil-define-key 'emacs eww-history-mode-map ; eww中用 H 進入歷史記錄
    (kbd "j") #'next-line
    (kbd "k") #'previous-line
    )

  ( evil-define-key 'emacs eww-bookmark-mode-map ; eww中用 B 進入歷史記錄
    (kbd "j") #'next-line
    (kbd "k") #'previous-line
    )


  )


(provide 'plugin/eww/eww-config)
