""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc of ci_knight
"
" Use Vim settings, rather then Vi settings.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:darwin = has('mac')

""""""""""""""""""""""""""""""
" About Vim-Plug
"
"""""""""""""""""""""""""""""
if filereadable(expand("~/.vim/autoload/init.vim"))
    source ~/.vim/autoload/init.vim
endif

" 编辑vimrc之后，重新加载 :source %
autocmd BufWritePost $MYVIMRC source $MYVIMRC


""""""""""
" Enable
""""""""""
" Filetype
filetype on  " 侦测文件类型
filetype plugin on  " 载入文件类型相关插件
filetype indent on  " 载入文件类型相关缩进文件
" Syntax
syntax enable
syntax on


"""""""""""""""
" Formatting
"""""""""""""""
set tabstop=4  " tab为4个空格
set softtabstop=4 " 让 vim 把连续数量的空格视为一个制表符
set shiftwidth=4 " 设置格式化时制表符占用空格数
set expandtab  " Tab转换为空格
set wildmenu  " Tab自动补全时，单行菜单形式显示
set wildmode=list:longest,list:full
set nowrap  " 不自动折行
set backspace=2   " Backspace deletes like most programs in insert mode"

""" 缩进
set autoindent  " 与前一行同样等级缩进
set smartindent  " C and Java 根据大括号等自动缩进
" set shiftround  " 更加智能的缩进，当遇到缩进不为整数与上对齐
set showmatch  " 括号匹配


""""""""""""""""""
" File
""""""""""""""""""
" file backup
set nobackup
set nowritebackup
set noswapfile
set history=100

" Need confrimation while exit
set confirm
set fileformat=unix

" save as sudo
ca w!! w !sudo tee "%"

" file auto do something
set autowrite     " Automatically :write before running commands
set autoread      " Set to auto read when a file is changed from the outside
set autowriteall
" set tw=140        " 140字符自动换行

" 文件类型配置
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
au BufRead,BufNewFile *.{js,json} set filetype=javascript
au BufRead,BufNewFile *.{html} set filetype=html
au BufRead,BufNewFile *.{css,scss,sass} set filetype=css
au BufRead,BufNewFile *.{py,pyc} set filetype=python
au BufRead,BufNewFile *.{go} set filetype=go
au BufRead,BufNewFile *.{c} set filetype=c
au BufRead,BufNewFile *.{cpp} set filetype=cpp
au BufRead,BufNewFile *.{ruby} set filetype=ruby
au BufRead,BufNewFile *.{sh} set filetype=sh
au BufRead,BufNewFile *.{java} set filetype=java
au BufRead,BufNewFile *.{lua} set filetype=lua


"""""""""""""""""""""
" General
"""""""""""""""""""""
set number
set relativenumber
set numberwidth=5

" display incomplete commands"
set showcmd

" 启动显示状态行(1),总是显示状态行(2)
set laststatus=2

" 禁止光标闪烁
set gcr=a:block-blinkon0

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 禁用Vi的兼容模式
set nocompatible

" 设定状态栏多显示信息
set noscrollbind
set nocursorbind

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Highlight current line
au WinEnter * set cursorline cursorcolumn
au WinLeave * set nocursorline nocursorcolumn
set cursorline cursorcolumn

" Searching
set incsearch     " do incremental searching
set hlsearch  " 检索时高亮显示匹配项
set ignorecase  " 搜索忽略大小写
set smartcase  " 智能大小写搜索

" encoding
set fileencodings=ucs-bom,utf-8,cp936,gbk,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8
set encoding=utf-8

" Folding
set foldenable
set foldlevelstart=10
set foldnestmax=10

" 基于缩进或语法进行代码折叠
set foldmethod=indent

" 启动 vim 时关闭折叠代码
set nofoldenable

" Enable folding with the spacebar
nnoremap <space> za

" 保存全局变量
set viminfo+=!

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

" Display extra whitespace
set list listchars=tab:»·,trail:·

"共享剪贴板
set clipboard+=unnamed


""""""""""""
" Key Map
""""""""""""
" tab navigation
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm<CR>
map tt :tabnew
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>

" arrow key map
nnoremap h <Left>
nnoremap j <Up>
nnoremap k <Down>
nnoremap l <Right>

" navigate window movement with C+arrows
nnoremap <C-j> <C-w>k
nnoremap <C-k> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" qq to record, Q to replay (recursive map due to peekaboo)
nmap Q @q

" Quickfix
nnoremap ]q :cnext<cr>zz
nnoremap [q :cprev<cr>zz
nnoremap ]l :lnext<cr>zz
nnoremap [l :lprev<cr>zz

" Buffers
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

" Tabs
nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>

" leader mapping
let mapleader = "," 
set timeoutlen=350  " wait leader

" file operate
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
inoremap <leader>w :w<CR>
inoremap <leader>q :q<CR>
nmap <Leader>Q :qa!<CR>

" 定义快捷键到行首和行尾
nmap lb 0
nmap le $

" 定义快捷键在结对符之间跳转
nmap <Leader>M %


""""""""""""""""""""""""
" Load file config
""""""""""""""""""""""""
" Python Stuffs
if filereadable(expand("~/.vim/ftplugin/python.vimrc"))
    source ~/.vim/ftplugin/python.vimrc
endif
" Html Stuffs
if filereadable(expand("~/.vim/ftplugin/frontend.vimrc"))
    source ~/.vim/ftplugin/frontend.vimrc
endif
" markwodn Stuffs
if filereadable(expand("~/.vim/ftplugin/markdown.vimrc"))
    source ~/.vim/ftplugin/markdown.vimrc
endif
" markwodn Stuffs
if filereadable(expand("~/.vim/ftplugin/newfile.vimrc"))
    source ~/.vim/ftplugin/newfile.vimrc
endif


"""""""""""""""""""
" Plugin config
"""""""""""""""""""
" Theme
if has('gui_running')
  set background=light
  colorscheme solarized
else
  set background=dark
  colorscheme molokai
endif

" define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred
" removes trailing spaces of python files (and restores cursor position)
autocmd BufWritePre *.py,*.vim,*.sh mark z | %s/ *$//e | 'z
" 标示不必要的空白字符
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" will insert tab at beginning of line,
" will use completion if not at beginning
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

"""" Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F6> :TagbarToggle<CR>

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
set matchpairs+=<:>

"""" Nerd Tree
let NERDChristmasTree=0
let NERDTreeWinSize=40
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
autocmd vimenter * if !argc() | NERDTree | endif " Automatically open a NERDTree if no files where specified
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " Close vim if the only window left open is a NERDTree
nmap <F5> :NERDTreeToggle<cr>

""""" ctrlp
" ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif     " MacOSX/Linux
" set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.pyc,*.png,*.jpg,*.gif  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" let g:ctrlp_custom_ignore = '\v\.(exe|so|dll)$'
let g:ctrlp_extensions = ['funky']

""""" PyMode settings
" close python mode Regenerate repo cache
let g:pymode_rope=0
let g:pymode_rope_lookup_project=0
" let g:pymode_python='python3'
" Documentation
let g:pymode_doc=0
let g:pymode_doc_key='K'
" Linting
let g:pymode_lint=1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'pep257']
let g:pymode_lint_ignore='E402,E501,D,W0401'
let g:pymode_lint_message=1
" Auto check on save
let g:pymode_lint_write=1
" Auto open cwindow (quickfix) if any errors have been found
let g:pymode_lint_cwindow=0
" Support virtualenv
let g:pymode_virtualenv=1
" Enable breakpoints plugin
let g:pymode_breakpoint=1
let g:pymode_breakpoint_bind='<leader>b'
" syntax highlighting
let g:pymode_syntax_all=1
" Don't autofold code
let g:pymode_folding=0
" End PyMode settings

""""" setup powerline
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
let g:Powerline_colorscheme='solarized256'

" 显示折叠代码的文档字符串
let g:SimpylFold_docstring_preview=1

""""" Indent Guides
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"""" ctrlsf
" 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>

"""" ycm
" YCM 补全菜单配色
" highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
" highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
set tags+=/data/misc/software/misc./vim/stdcpp.tags
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
let g:syntastic_always_populate_loc_list=1
let g:ycm_autoclose_preview_window_after_completion=1
let python_highlight_all=1
" Switch between the last two files
nnoremap <leader><leader> <c-^>
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_key_list_select_completion=['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<c-p>', '<Up>']

"""" Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsJumpBackwardTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
