(use-package tab-bar
  :ensure nil
  :init
  ; (tab-bar-mode 1) ; 用1 會一直顯示, 即便只有一個也是一樣

  :bind
  (:map evil-normal-state-map
        ("gt" . tab-bar-switch-to-next-tab)
        ("gT" . tab-bar-switch-to-prev-tab)
        ("M-t" . tab-bar-new-tab) ; ("A-t" . tab-bar-new-tab)
        ; ("g x" . tab-bar-close-tab) ; 可用`:tabc`來關就好.
  )
)
(provide 'config/tab-bar)
