(defun cd-here ()
  "切換工作目錄到當前檔案的資料夾"
  (interactive)
  (unless buffer-file-name
    (user-error "Current buffer is not visiting a file"))
  (cd (file-name-directory buffer-file-name))
  (message "cwd => %s" default-directory))

(with-eval-after-load 'evil
  ;; nnoremap <A-w> <C-w>w<CR>
  ;; nnoremap <A-h> <C-w>h<CR>
  ;; nnoremap <A-j> <C-w>j<CR>
  ;; nnoremap <A-k> <C-w>k<CR>
  ;; nnoremap <A-l> <C-w>l<CR>
  (define-key evil-normal-state-map (kbd "M-w") #'other-window)
  (define-key evil-normal-state-map (kbd "M-h") #'windmove-left)
  (define-key evil-normal-state-map (kbd "M-j") #'windmove-down)
  (define-key evil-normal-state-map (kbd "M-k") #'windmove-up)
  (define-key evil-normal-state-map (kbd "M-l") #'windmove-right)

  (evil-ex-define-cmd "Cd"                             #'cd-here)
  (define-key evil-normal-state-map (kbd "<leader>cd") #'cd-here)
  )

(provide 'config/keymaps)
