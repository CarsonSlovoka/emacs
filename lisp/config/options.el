;;; 可選項設定

;; t 指的是 true ;
;; nil或0 預設行為;
;; 負數(通常-1): 關閉

;; ;; 不顯示工具列
;; (tool-bar-mode -1)
;;
;; ;; 不顯示捲軸
;; (scroll-bar-mode -1)
;;
;; 不顯示選單列 {File, Edit, Options, Buffers Tools Sh-Script Help} 等這些資訊
(menu-bar-mode -1)


;; 顯示行號
(setq display-line-numbers-type 'relative) ; 加這個才會顯示相對行號
(global-display-line-numbers-mode 1)
;;
;; ;; 顯示欄號
;; (column-number-mode 1)
;;
;; ;; 使用空白取代 Tab
;; (setq-default indent-tabs-mode nil)
;;
;; ;; Tab 寬度
;; (setq-default tab-width 4)

;; ;; 開敵Which-Key
;; (which-key-mode 1)


;;; 備分
;; M-h v make-backup-files
;; 不建立 backup file (xxx~)
(setq make-backup-files nil)

;; 不建立 auto save (#xxx#)
(setq auto-save-default nil)

;; 不建立 lock file (.#xxx)
(setq create-lockfiles nil)

(provide 'config/options)
