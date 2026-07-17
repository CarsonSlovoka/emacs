;; Caution 不能使用 tetris.el當成檔名，因為名稱會衝突到，可以用 `M-: locate-library "tetris"` 就會曉得是抓哪裡的檔案
;;; 用homebrew裝的路徑: /opt/homebrew/Cellar/emacs/30.2_2/share/emacs/30.2/lisp/play/tetris.elc

(use-package tetris
  :ensure nil
  :defer t
  :config

  (evil-set-initial-state 'tetris-mode 'normal) ; 這邊可以調整預設進入要使用的mode, 原本是E
  (evil-define-key 'normal tetris-mode-map
    ;; 移動
                   ;; 移動
                   (kbd "h")   #'tetris-move-left
                   (kbd "j")   #'tetris-move-down
                   (kbd "l")   #'tetris-move-right
                   (kbd "SPC") #'tetris-move-bottom

                   ;; 旋轉
                   (kbd "k")   #'tetris-rotate-prev
                   (kbd "z")   #'tetris-rotate-next ; 預設的熱鍵中沒有這個
                   (kbd "x")   #'tetris-rotate-prev

                   ;; 遊戲控制
                   (kbd "n")   #'tetris-start-game
                   (kbd "p")   #'tetris-pause-game
                   (kbd "q")   #'tetris-end-game
                   )

  ;; 固定下落速度：每 0.5 秒下降一格
  (setq tetris-update-speed-function
        (lambda (_shapes _rows)
          0.5))
  )

(provide 'game/tetris-config)
