## Install Emacs

```sh
brew install emacs
```


## 新手需知

### 熱鍵

- ⭐ `C-h k` 接著可以按下熱鍵(例如: `M-.`)，就會曉得該熱鍵是什麼功能.
    - 範例: `C-h k C-h k`會得到: C-h k runs the command **describe-key** (found in global-map). 當中的: `describe-key`就是它的名稱，能利用這個名稱來改它的熱鍵
- `C-g`: 取消. ，這個g從Emacs很早以前(1970年代)就留下來的按鍵設定，沒什麼特別的意思. (可能是: 容易按, Give up, Go back, Goodbye...)
- `M-:`: (alt+shift+;) 開啟Eval: 模式. 在此模式如果想要離開可以使用`C-g`
- `C-h m`: 打開幫助help + man. 在裡面不要時，可以到該視窗然後按下q, 則可以關閉


### Debug lisp

先在想要的函數內，例如:

```el
(defun my/add-tax (price)
  (let ((tax (* price 0.05)))
    (+ price tax)))
```

用`M-x edebug-defun`，接著再手動執行函數，例如: `:(my/add-tax 55)`

輸入後會發現進入了debugging的模式(此時為read only)


接著可以用`?`查看幫助

| 按鍵    | 功能                                | Binding                   | Note                                            |
| :--:    | ------------------------            | ----                      | --------------------------                      |
| `SPC`   | 執行到下一個細部運算點              | edebug-step-mode          | step into                                       |
| `b`     | 在目前位置設定／取消 breakpoint     | edebug-set-breakpoint     |                                                 |
| `g`     | 繼續執行到 breakpoint               | edebug-go-mode            |                                                 |
| `e`     | 在目前環境中計算 Lisp expression    |                           | 輸入後會看到`Edebug eval:` 再輸入變數即可查看   |
| `q`     | 中止除錯                            | top-level                 |                                                 |
| `?`     | 顯示所有 Edebug 指令                |                           |                                                 |
| ...     |                                     |                           |                                                 |
