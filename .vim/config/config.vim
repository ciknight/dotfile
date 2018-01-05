filetype plugin indent on " Automatically detect file types.
syntax on " Syntax highlighting

set backspace=2 " Backspace deletes like most programs in insert mode"
set history=2000
set laststatus=2
set linespace=0 " No extra spaces between rows
set softtabstop=4 " 让 vim 把连续数量的空格视为一个制表符
set shiftwidth=4 " 设置格式化时制表符占用空格数
set tabpagemax=15 " Only show 15 tabs
set tabstop=4 " An indentation every four columns"
" set textwidth=140 " 140字符自动换行

" set autoindent " 与前一行同样等级缩进
set smartindent " 更加智能的缩进，当遇到缩进不为整数与上对齐
set backspace=indent,eol,start  " Backspace for dummies
set expandtab " Tab转换为空格

set shiftround
set showmatch " 括号匹配
set matchtime=2 " How many tenths of a second to blink when matching brackets
set mouse-=a  " 鼠标暂不启用
set nowrap " 不自动折行
set clipboard+=unnamed "共享剪贴板
set viminfo+=! " 保存全局变量

set nocompatible " 禁用Vi的兼容模式,去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set wildmenu " Tab自动补全时，单行菜单形式显示
set wildmode=list:longest,list:full
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif     " MacOSX/Linux


"==========================================
" File Settings
"==========================================
set fileformat=unix

set nobackup " file backup
set nowritebackup
set noswapfile

set confirm " Need confrimation while exit
set autowrite     " Automatically :write before running commands
set autoread      " Set to auto read when a file is changed from the outside
set autowriteall

" save as sudo
ca w!! w !sudo tee "%"


"==========================================
" Display Setting
"==========================================
set showcmd " display incomplete commands"
set gcr=a:block-blinkon0 " 禁止光标闪烁

set number numberwidth=4
set relativenumber
set cursorline cursorcolumn
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
" Highlight current line
autocmd WinEnter * set cursorline cursorcolumn
autocmd WinLeave * set nocursorline nocursorcolumn

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 设定状态栏多显示信息
set noscrollbind
set nocursorbind

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Searching
set incsearch " do incremental searching
set hlsearch " 检索时高亮显示匹配项
set ignorecase " 搜索忽略大小写
set smartcase " 智能大小写搜索

" 去掉输入错误的提示声音
set novisualbell
set noerrorbells

" encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gbk,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn

" Folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent  " 基于缩进或语法进行代码折叠
set nofoldenable " 启动 vim 时关闭折叠代码

set list listchars=tab:»·,trail:· " Display extra whitespace
set iskeyword+=_,$,@,%,#,- " 带有如下符号的单词不要被换行分割

" 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 不需要可以去掉
set t_ti= t_te=
set t_vb=
set tm=500

" 设置标记一列的背景颜色和数字一行颜色一致
highlight! link SignColumn LineNr
highlight! link ShowMarksHLl DiffAdd
highlight! link ShowMarksHLu DiffChange
" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline
