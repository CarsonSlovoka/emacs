;; Caution 不能使用 tetris.el當成檔名，因為名稱會衝突到，可以用 `M-: locate-library "tetris"` 就會曉得是抓哪裡的檔案
;;; 用homebrew裝的路徑: /opt/homebrew/Cellar/emacs/30.2_2/share/emacs/30.2/lisp/play/tetris.elc


(defun my-tetris-update-speed (_shapes rows)
  "依照已消除的行數逐漸加快。"
  (max 0.08 ; 限制最快只能0.08秒降一格
       (- 0.5 (* rows 0.01)))) ; 初始0.5秒, 之後每消一行會降0.01 => 消10行後會變成0.4

(use-package tetris
  :ensure nil
  :defer t
  :config

  ;; (evil-set-initial-state 'tetris-mode 'normal) ; 這邊可以調整預設進入要使用的mode, 原本是emacs
  ;; (evil-define-key 'normal tetris-mode-map
  (evil-define-key 'emacs tetris-mode-map ; 直接在原本的state: emacs 修改即可
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

  ;; ;; 固定下落速度：每 0.5 秒下降一格
  ;; (setq tetris-update-speed-function
  ;;       (lambda (_shapes _rows)
  ;;         0.5))

  (setq tetris-update-speed-function
        #'my-tetris-update-speed)
  )

(provide 'game/tetris-config)
