;; Caution 不能使用 tetris.el當成檔名，因為名稱會衝突到，可以用 `M-: locate-library "tetris"` 就會曉得是抓哪裡的檔案
;;; 用homebrew裝的路徑: /opt/homebrew/Cellar/emacs/30.2_2/share/emacs/30.2/lisp/play/tetris.elc


(use-package tetris
  :ensure nil
  :defer t
  :config

  ;; 手動速度倍率：
  ;; 1.0 = 預設
  ;; 小於 1.0 = 更快
  ;; 大於 1.0 = 更慢
  (defvar-local my-tetris-speed-factor 1.0)

  ;; 每次: my-tetris-speed-factor 要調整的幅度
  (defvar-local my-tetris-faster-step 0.8) ; 例如: 每加速一次當前: my-tetris-speed-factor 會是 my-tetris-speed-factor * my-tetris-faster-step
  (defvar-local my-tetris-lower-step 1.25)
  ;; Note: 最終的速度還需要用: my-tetris-speed-factor * my-tetris-base-speed (當前遊戲的速度) 才會確定

  ;; 手動倍率的上下限: 指: my-tetris-speed-factor 的值只會在這區間
  (defconst my-tetris-min-speed-factor 0.1)
  (defconst my-tetris-max-speed-factor 8.0)

  ;; 最終下落間隔的上下限，避免過快或過慢
  ;; Note: emacs中沒有真正的const, defconst只是「這個值不應該修改」但不是不能改. 此外社群不建議用大寫.
  (defconst my-tetris-min-tick-period 0.05) ; 最快只能每 0.05秒,下落1格
  (defconst my-tetris-max-tick-period 2.0)  ; 最慢每2秒一定會下落1格

  ;;; defun
  (defun my-tetris-base-speed (_shapes rows)
    "依照已消除的行數逐漸加快"
    ;; 0 行：0.50 秒
    ;; 10 行：0.40 秒
    ;; 20 行：0.30 秒
    ;; 最快不低於 0.08 秒
    (max 0.08 ; 限制最快只能0.08秒降一格
         (- 0.5 (* rows 0.01)))) ; 初始0.5秒, 之後每消一行會降0.01 => 消10行後會變成0.4

  (defun my-tetris-update-speed (shapes rows)
    "遊戲真實速度 = 當前正常的遊戲速度 * 自定義加速因子"
    ;; 最快下落速度: my-tetris-min-tick-period
    ;; 最慢下落速度: my-tetris-max-tick-period
    (let ((period
           (* (my-tetris-base-speed shapes rows)
              my-tetris-speed-factor))) ; period = 當前的速度 * my-tetris-speed-factor
      (max my-tetris-min-tick-period      ; 接著在確保period的上限
           (min my-tetris-max-tick-period ; 先讓period確保下限
                period))))

  (defun my-tetris-apply-speed ()
    "立即套用目前的 Tetris 速度"
    (let ((period (tetris-get-tick-period)))
      (when (and period gamegrid-timer)
        (gamegrid-set-timer period))

      (message
       "Tetris：Rows %d，手動倍率 %.2fx，下落間隔 %.3f 秒"
       tetris-n-rows
       my-tetris-speed-factor
       period)))

  (defun my-tetris-faster ()
    "在目前自動速度的基礎上額外加快"
    (interactive)
    (setq my-tetris-speed-factor
          (max my-tetris-min-speed-factor
               ;; (* my-tetris-speed-factor 0.8)))
               (* my-tetris-speed-factor my-tetris-faster-step)))
    (my-tetris-apply-speed))

  (defun my-tetris-slower ()
    "在目前自動速度的基礎上額外減慢"
    (interactive)
    (setq my-tetris-speed-factor
          (min my-tetris-max-speed-factor
               ;; (* my-tetris-speed-factor 1.25)))
               (* my-tetris-speed-factor my-tetris-lower-step)))
    (my-tetris-apply-speed))

  (defun my-tetris-reset-speed ()
    "清除手動調整，恢復目前行數對應的自動速度"
    (interactive)
    (setq my-tetris-speed-factor 1.0)
    (my-tetris-apply-speed))

  ;;; keymap
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
                   (kbd "a")   #'tetris-rotate-next
                   (kbd "x")   #'tetris-rotate-prev

                   ;; 遊戲控制
                   (kbd "n")   #'tetris-start-game
                   (kbd "p")   #'tetris-pause-game
                   (kbd "q")   #'tetris-end-game

                   ;; 速度控制
                   (kbd "+")   #'my-tetris-faster
                   (kbd "=")   #'my-tetris-faster

                   (kbd "-")   #'my-tetris-slower
                   (kbd "0")   #'my-tetris-reset-speed
                   )

  ;; ;; 固定下落速度：每 0.5 秒下降一格
  ;; (setq tetris-update-speed-function
  ;;       (lambda (_shapes _rows)
  ;;         0.5))

  (setq tetris-update-speed-function
        #'my-tetris-update-speed)
  )

(provide 'game/tetris-config)
