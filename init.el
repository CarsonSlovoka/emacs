;;; 🟧 註解
;; 註解: 一個分號 ; 用於程式碼後面的行尾註解 (inline comment)
;;
;; 兩個;; 這是最常見，也是最推薦的註解方式
;; Note: 用;和;;其實都能通用, 只是約定俗成上更偏向區分
;;
;; 三個;;; 表示一個章節或區塊的開始
;;
;; 四個;;;; 很大的章節. 一般使用者幾乎不會用到
;; M-; (alt+;) 可以註解. 用V下，再用它就可以整列註解


;;; 🟧 package 管理
;; ;; 這一段是Emacs 26~28時代，幾乎都是必寫的內容. Emacs29/30以後，可以先忽略
;; (require 'package) ; 載入Emacs的套件管理器: package.el # Note: Emacs本身有很多模組: 例如: package, dired, org, clendar. 都可以用 (require 'xxx) 的方式來載入
;;
;; ;; 以下這段是告訴package去哪裡下載套件
;; ;; Emacs 官方只有 GNU ELPA
;; ;; 很多第三方套件（像 evil、magit、consult）都放在 MELPA
;; (add-to-list 'package-archives
;;              '("melpa" . "https://melpa.org/packages/")
;;              t)

;; (package-initialize) ; 初始化套件管理器: {掃描已安裝套件, 加到 load-path, 可以 require}

;;; 🟧 use-package
;; Evil ; Important: 使用Evil可以讓emacs的操作盡量和nvim相同
;; use-package 利用 package 去安裝東西
(use-package evil  ; 設定一個叫做 evil 的套件. 類似lua的require
  :ensure t        ; 如果沒有安裝，就會自動安裝. 如果是用 `:ensure nil` 為不安裝. 如果是這種情況通常是用在Emacs內建已經內建的內容
  :config          ; 套件載入完成後，要執行下面這些這定
  (evil-mode 1))   ; 開啟Evil Mode. 很多Emacs套件都是 (xxx-mode 1)
;; 等同: `package-install evil`

;;; 🟧 可選項設定
;; ;; 不顯示工具列
;; (tool-bar-mode -1)
;;
;; ;; 不顯示捲軸
;; (scroll-bar-mode -1)
;;
;; ;; 不顯示選單列（可選）
;; (menu-bar-mode -1)
;;
;; ;; 顯示行號
;; (global-display-line-numbers-mode 1)
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
