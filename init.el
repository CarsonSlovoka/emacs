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

;;; 🟧 將 ./lisp 目錄加入載入路徑. 缺點: 子目錄的檔案不會主動抓，要手動加入
; (add-to-list 'load-path
;               (expand-file-name "lisp" user-emacs-directory))
; (add-to-list 'load-path
;               (expand-file-name "lisp/tests" user-emacs-directory))

;; 利用: normal-top-level-add-subdirs-to-load-path 缺點: lisp/*.el 不會進來
;; (let ((default-directory  ; 用這種方式，就可以將lisp/**/*.el也都會考慮進來. 從 default-directory 開始，把所有符合條件的子目錄加入 load-path. Warn: 但是lisp/*.el中的內容就不會被納入，要有子目錄才可以
;;         (expand-file-name "lisp" user-emacs-directory)))
;;   (normal-top-level-add-subdirs-to-load-path))

;; 定義變數
(defconst my/lisp-dir
  (expand-file-name "lisp" user-emacs-directory))

;; 加入變數的內容到 load-path 之中
(add-to-list 'load-path my/lisp-dir)

;; Tip: 如此就比較自由，也不需要用內建的: (normal-top-level-add-subdirs-to-load-path) 來輔助
;; 這種方式，可以對 lisp/*.ls, list/**/*.ls都能抓到
(dolist (dir (directory-files my/lisp-dir t "^[^.].*"))
  (when (file-directory-p dir)
    (add-to-list 'load-path dir)))

(require 'init-evil)         ; lisp/init-evil.el
(require 'init-clipboard)    ; lisp/init-clipboard.el
(require 'test_hello)        ; lisp/tests/test_hello.el

;;; 🟧 可選項設定
;; t 指的是 true ;
;; nil或0 預設行為;
;; 負數(通常-1): 關閉


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
