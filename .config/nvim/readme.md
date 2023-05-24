# Help

## Common

:help jump-motions
- :set scroll=10 设置滚动屏幕行数
- :set scrolloff=3 当光标与顶部距离为三行时发生翻滚，且翻滚后光标与底部相距三行。
- NC-u 上滚动屏幕(半屏)
- NC-d 下滚动屏幕(半屏)
- C-f Linux下，是forward滚动屏幕(一屏)
- C-b 上滚(一屏)
- '/~ 和进来的位置跳转

:help ctrl-i/ctrl-o
- C-o 后退
- C-i/tab 前进

:help mark-motions
- m{a-z} 当前文件标记
- m{A-Z} 所有文件都可以进入该标记，只要缓冲区没删
- '{aA-zZ} 跳转到标记
- :marks/:delmarks 管理标记

:help N%, N指number

除了g,gg,G,NG,L,M,H,0,$,^,Nf{}
- 70% 跳转到70%位置
- ^ 行首的第一个非空白字符
- b/w/e 单词间移动
- :ls 查看缓冲区，跳转文件都会打开一个缓冲区
- :e 打开一个文件
- :vsplit

:help register

- :registers 列出所有寄存器
- "{0-9,a-z,A-Z}y 复制到寄存器
- "{0-9,a-z,A-Z}p 把某个寄存器粘贴到光标处

- :!+cmd 运行一个外部命令
- :!! 运行上一个命令
- :terminal 打开一个纵断

- ~ 转换大小写
- u 选中的转换成小写
- U 选中的转换成大写

- :silent+!+cmd 静默执行命令

:help ctrl-a/:help v\_CTRL-A

- C-a/C-x 加减数值

:help sort

:help diff

:history 显示执行命令历史


## CocCommand
:CocCommand workspace.showOutput, 可以显示执行命令的输出，调试时很有帮助  # https://github.com/fannheyward/coc-pyright/issues/229

## Python

:CocCommand python.sortImports
c-j/c-k 在snippet中移动

### Pyright

:CocCommand pyright.organizeimports
:CocCommand pyright.createtypestub $Package

### Debug

:checkhealth
