;; Evil ; Important: 使用Evil可以讓emacs的操作盡量和nvim相同
;; use-package 利用 package 去安裝東西
(use-package evil  ; 設定一個叫做 evil 的套件. 類似lua的require
  :ensure t        ; 如果沒有安裝，就會自動安裝. 如果是用 `:ensure nil` 為不安裝. 如果是這種情況通常是用在Emacs內建已經內建的內容
  :config          ; 套件載入完成後，要執行下面這些這定
  (evil-mode 1)    ; 開啟Evil Mode. 很多Emacs套件都是 (xxx-mode 1)
  ;; 🔎 跳到定義   ; Warn: 當文件只有載入buffer時，直接這樣跳轉是無效的，都會看到No definitions found for: xxx. 應該要先執行 `M-x eval-buffer` 之後使用就會有效了
  (define-key evil-normal-state-map
              (kbd "]c"); (kbd "M-.") 👈 這是預設   (kbd "gd"), (kbd "C-]")
              #'xref-find-definitions)

  ;; ↩️ 回到跳轉前的位置
  (define-key evil-normal-state-map
              (kbd "C-o")  ; (kbd "M-,")
              #'xref-go-back)
)
;; 等同: `package-install evil`

;; 如果不想要在evil中設定熱鍵，也可以用以下的方式來調整
;; (keymap-global-unset "M-.") ; 移除原本的熱鍵
;; (keymap-set global-map "C-c d" #'xref-find-definitions)

(provide 'init-evil) ; Important: 這個和require是匹配的，有這個外面用require才會有用
