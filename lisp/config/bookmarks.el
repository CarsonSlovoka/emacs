
; C-x r m  ; mark. 加入書籤 Important: 書籤保存位置: ~/.emacs.d/bookmarks
; C-x r b  ; book. 跳轉到指定的書籤

;;; C-x r l  ; list. 顯示書籤清單(當中能管理和跳轉)
;; ? 顯示幫助
;; p 往上移動
;; n 往下移動
;; d 標記刪除
;; D 標記全部刪除
;; x 將d, D標記的內容真得刪除
;; r rename Tip: 先用 ↑ 可以得到之前的名稱
;; s save
;; q 離開
;; / 搜尋
;; DEL (backspace) 移動到下方之後再按下，可以刪除標記. d或D錯了，可以用它來清除標記

;; t 顯示檔案的完整路徑


; Note: Emacs Lisp 通常建議函式名稱使用小寫與連字號
; (defun Bkadd (name) ; 所謂的參數不是 `:BkAdd para1`, 這種的輸入方式，都只能`:BkAdd`先按下enter在用給的提示詞來輸入
(defun bk-add (name)
  "新增一個 bookmark"
  ; (interactive "bookmark name: ") ; ⚠️ 第一個單字b，表示輸入要是buffer，所以b消失敗
  ; (interactive "sbookmark name: ") ; s表示字串. 如果用s它不會有預設值
  ; (interactive "bbookmark name: ")   ; b會有預設值(當前使用的buffer). 但是限定輸入一定要是buffer, 不能是任意的字串
  ; (interactive "Bbookmark name: ") ; B也是buffer但可以不存在
  (interactive ; 用這種方式可以帶出預設值
   (list
    (read-string
     "Bookmark name: "
     (file-name-nondirectory (buffer-file-name)))))
  (bookmark-set name)) ; name如果為空 bookmark-set 預設用buffer的名稱

(provide 'config/bookmarks)
