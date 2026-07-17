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

  ;; 改變state的顯示，更加清楚
  ;; 這些可行，但是沒有顏色,和樣式
  ;; (setq evil-normal-state-tag   " <NORMAL> "
  ;;       evil-insert-state-tag   " <INSERT> "
  ;;       ...
  ;;       )

  ;; 以下可以有顏色和樣式，但是顏色在失焦的window上還是會有
  ;; (setq evil-normal-state-tag
  ;;       (propertize " NORMAL "
  ;;                   'face '(:foreground "#101216"
  ;;                                       :background "#5d99fe"
  ;;                                       :weight bold))
  ;;       evil-insert-state-tag
  ;;       (propertize " INSERT "
  ;;                   'face '(:foreground "#101216"
  ;;                                       :background "#44b347"
  ;;                                       :weight bold))
  ;;       ...
  ;;       )


  ;; 利用: `mode-line-window-selected-p` 達成只在focus的視窗才會改state-tag
  (defun my-evil-tag (text fg bg)
    (propertize
     text
     'face
     (if (mode-line-window-selected-p) ; Tip: `mode-line-window-selected-p` 在 Emacs 30 是內建的，它會判斷目前 mode-line 是不是屬於被選取的 window。 失去 focus 的 window 就會完全使用 mode-line-inactive 的樣式
         `(:foreground ,fg
                       :background ,bg
                       :weight bold)
       'mode-line-inactive)))

  (setq evil-normal-state-tag
        '(:eval (my-evil-tag " NORMAL " "#101216" "#5d99fe"))

        evil-insert-state-tag
        '(:eval (my-evil-tag " INSERT " "#101216" "#44b347"))

        evil-visual-state-tag
        '(:eval (my-evil-tag " VISUAL " "#101216" "#c69026"))

        evil-replace-state-tag
        '(:eval (my-evil-tag " REPLACE " "#101216" "#f66f6a"))

        evil-operator-state-tag
        '(:eval (my-evil-tag "  OPERATOR " "black" "orange"))

        evil-motion-state-tag
        '(:eval (my-evil-tag " MOTION " "black" "blue"))

        evil-emacs-state-tag
        '(:eval (my-evil-tag " EMACS " "white" "gray40"))

        )



  )

;; 等同: `package-install evil`

;; 如果不想要在evil中設定熱鍵，也可以用以下的方式來調整
;; (keymap-global-unset "M-.") ; 移除原本的熱鍵
;; (keymap-set global-map "C-c d" #'xref-find-definitions)
;; (bind-key "C-c l" 'goto-line) ; ✅


;; Must be set BEFORE defining key sequences
(setq evil-leader/in-all-states t)

;; Assign the core triggers using Evil functions
(evil-set-leader 'normal (kbd "\\"))
(evil-set-leader 'motion (kbd "\\"))

;; Bind keys specifically inside the leader map
(evil-define-key 'normal 'global (kbd "<leader>bk") 'list-bookmarks)

(evil-define-key 'normal 'global (kbd "C-o") #'evil-jump-backward)
(evil-define-key 'normal 'global (kbd "C-i") #'evil-jump-forward)

(provide 'init-evil) ; Important: 這個和require是匹配的，有這個外面用require才會有用
