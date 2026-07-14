;; Note: 需要由 melpa 來得到
;; `fd doom-themes ~/.emacs.d -HIa`
;; `fd doom-one    ~/.emacs.d -HIa`
;; `fd doom        ~/.emacs.d -HIa`

;; https://github.com/doomemacs/themes
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t)              ; 最多人用, 程式碼辨識度高
  ; (load-theme 'doom-acario-dark t)    ; 這主題也不錯，比doom-one要亮一點
  )

(provide 'config/themes)

