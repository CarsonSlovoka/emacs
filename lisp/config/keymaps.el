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
  )

(provide 'config/keymaps)
