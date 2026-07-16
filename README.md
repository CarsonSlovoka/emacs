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
- `C-h m`: 打開幫助help + man (mode). 在裡面不要時，可以到該視窗然後按下q, 則可以關閉
    - ⭐ 除了看幫助也可以查看當前是`major mode`, `minor mode`是什麼


### ⭐ State


狀態列
```
L1  <E>  (Tetris)

L1  <M>  (Help Outl)
```

當中的`<E>` 就是目前的 Evil state，代表 Emacs state

當中的 `<M>`表示motion state



| 顯示    | State    | 用途                           |
| -----   | -------- | --------------------           |
| `<N>`   | Normal   | Vim 一般操作、移動、刪除       |
| `<I>`   | Insert   | 輸入文字                       |
| `<V>`   | Visual   | 選取文字                       |
| `<R>`   | Replace  | 取代文字                       |
| `<O>`   | Operator | 等待 motion，例如按了 `d`      |
| `<M>`   | Motion   | 只能移動，常見於 Help buffer (這種模式下，通常會有一些額外自定義的按鍵能按)  |
| `<E>`   | Emacs    | 暫時停用 Evil 的 Vim 按鍵解讀  |


怎麼切換 state？

常用命令是：

- `M-x evil-normal-state`
- `M-x evil-insert-state`
- `M-x evil-emacs-state`
- `M-x evil-motion-state`

常見按鍵：
- i        Normal → Insert
- ESC      Insert → Normal
- v        Normal → Visual
- C-z      Normal ↔ Emacs

在 Evil 的預設設定中，`C-z` 通常是切換：

> Normal state → Emacs state
>
> Emacs state  → 之前的 state


底下是在tetris中會的F1, 選b (binding)所到的幫助
```sh
# 這沒有寫state時，就表示<E> Emacs
SPC                 tetris-move-bottom
n                   tetris-start-game
p                   tetris-pause-game
q                   tetris-end-game
<down>              tetris-move-down
<left>              tetris-move-left
<right>             tetris-move-right
<up>                tetris-rotate-prev

# 👇 底下是自定義的state
<normal-state> SPC  tetris-move-bottom
<normal-state> h    tetris-move-left
<normal-state> j    tetris-move-down
<normal-state> k    tetris-rotate-prev
<normal-state> l    tetris-move-right
<normal-state> n    tetris-start-game
<normal-state> p    tetris-pause-game
<normal-state> q    tetris-end-game
<normal-state> x    tetris-rotate-prev
<normal-state> z    tetris-rotate-next
```

> [!IMPORTANT] 在不同的state所能使用的熱鍵可能是不同的

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
