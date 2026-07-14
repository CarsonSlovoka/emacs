;;; 🟧 package 管理
(require 'package) ; 載入Emacs的套件管理器: package.el # Note: Emacs本身有很多模組: 例如: package, dired, org, clendar. 都可以用 (require 'xxx) 的方式來載入
;;
;; ;; 以下這段是告訴package去哪裡下載套件
;; ;; Emacs 官方只有 GNU ELPA
;; ;; 很多第三方套件（像 evil、magit、consult）都放在 melpa
;; (add-to-list 'package-archives
;;              '("melpa" . "https://melpa.org/packages/")
;;              t)

(require 'package)
(setq package-archives
      '(
        ; ("gnu"   . "https://elpa.gnu.org/packages/")    ; 安全性最高，由 GNU 專案維護
        ; ("nongnu". "https://elpa.nongnu.org/nongnu/")   ; 由 GNU 官方維護，但允許非 GPL 的套件，安全性也很高
        ("melpa" . "https://melpa.org/packages/")         ; MELPA：社群維護，套件最多，但審核較寬鬆. 不過所有人都可以看到原始碼
        )
)

(package-initialize) ; 初始化套件管理器: {掃描已安裝套件, 加到 load-path, 可以 require}

;; 建立索引在: package-archive-contents 此變數之中. 如果目前還沒有套件索引，就下載一次.
;; 如果沒有加，每次啟動emacs時都會將 package-archives 提到的內容: 重新下載所有 package index。
(unless package-archive-contents
  (package-refresh-contents))


; ;; 如果 use-package 就會去安裝它 Note: Emacs 30預設就已經有了
; (unless (package-installed-p 'use-package)
;   (package-install 'use-package))


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

(require 'test_hello)        ; lisp/tests/test_hello.el

(require 'config/options)    ; lisp/config/options.el
(require 'config/tab-bar)    ; lisp/config/tab-bar.el
(require 'config/themes)     ; lisp/config/themes.el

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
