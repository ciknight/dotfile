"==========================================
" .vimrc of ci_knight
" 
" blog site https://blog.ibeats.top
" 
"==========================================


"==========================================
" Initial Vim Plugin
"==========================================
if filereadable(expand("~/.vim/autoload/init.vim"))
    source ~/.vim/autoload/init.vim
endif

" 编辑vimrc之后，重新加载 :source %
autocmd BufWritePost $MYVIMRC source $MYVIMRC


"==========================================
" General Settings
"==========================================

" Filetype
filetype on 
" 载入文件类型相关插件
filetype plugin on
" 载入文件类型相关缩进文件
filetype indent on
" 开启语法高亮
syntax on
" Syntax
syntax enable

" tab为4个空格
set tabstop=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" Tab转换为空格
set expandtab
" Tab自动补全时，单行菜单形式显示
set wildmenu
" 不自动折行
set nowrap
" Backspace deletes like most programs in insert mode"
set backspace=2
" 与前一行同样等级缩进
set autoindent
" C and Java 根据大括号等自动缩进
set smartindent
" 更加智能的缩进，当遇到缩进不为整数与上对齐
" set shiftround
" 括号匹配
set showmatch
" history存储容量
" How many tenths of a second to blink when matching brackets
set matchtime=2
set history=2000

set wildmode=list:longest,list:full
" ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif     " MacOSX/Linux
" set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.pyc,*.png,*.jpg,*.gif  " Windows
" 鼠标暂不启用, 键盘党....
set mouse-=a


"==========================================
" File Settings
"==========================================

" file backup
set nobackup
set nowritebackup
set noswapfile

" Need confrimation while exit
set confirm
set fileformat=unix

" file auto do something
set autowrite     " Automatically :write before running commands
set autoread      " Set to auto read when a file is changed from the outside
set autowriteall
" save as sudo
ca w!! w !sudo tee "%"
" 140字符自动换行
" set tw=140

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


"==========================================
" General Display
"==========================================

set number
set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
set numberwidth=5
" display incomplete commands"
set showcmd
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
" 禁用Vi的兼容模式,去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
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
" 去掉输入错误的提示声音
set novisualbell
set noerrorbells
set t_vb=
set tm=500
" encoding
set encoding=utf-8
" new file
set fileencodings=ucs-bom,utf-8,cp936,gbk,gb18030,big5,euc-jp,euc-kr,latin1
" write file
set fileencoding=utf-8
set helplang=cn
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
" 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 不需要可以去掉
set t_ti= t_te=
" 设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

"==========================================
" Key Map
"==========================================
" tab navigation
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm<CR>
map tt :tabnew<CR>

" 关闭方向键, 强迫自己用 hjkl
" map <Left> <Nop>
" map <Right> <Nop>
" map <Up> <Nop>
" map <Down> <Nop>

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
nnoremap Q @q

" 定义快捷键到行首和行尾
nnoremap lt ^
nnoremap le $

" Quickfix
nnoremap ]q :cnext<CR>zz
nnoremap [q :cprev<CR>zz
nnoremap ]l :lnext<CR>zz
nnoremap [l :lprev<CR>zz

" Buffers
nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>

" Tabs
nnoremap ]t :tabn<CR>
nnoremap [t :tabp<CR>

" F1 - F6 设置

" F1 废弃这个键,防止调出系统帮助
" I can type :help on my own, thanks.  Protect your fat fingers from the evils of <F1>
noremap <F1> <Esc>"

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" F2 行号开关，用于鼠标复制代码用
" 为方便复制，用<F2>开启/关闭行号显示:
function! HideNumber()
    if(&relativenumber == &number)
        set relativenumber! number!
    elseif(&number)
        set number!
    else
        set relativenumber!
    endif
    set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>
" F3 显示可打印字符开关
nnoremap <F3> :set list! list?<CR>
" F4 换行开关
nnoremap <F4> :set wrap! wrap?<CR>
" leader mapping
let mapleader = ","
set timeoutlen=350  " wait leader

set pastetoggle=<F5>            "    when in insert mode, press <F5> to go to
"    paste mode, where you can paste mass data
"    that won't be autoindented

" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste

" F5 set paste问题已解决, 粘贴代码前不需要按F5了
" F5 粘贴模式paste_mode开关,用于有格式的代码粘贴
" Automatically set paste mode in Vim when pasting in insert mode
function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" file operate
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
inoremap <leader>w :w<CR>
inoremap <leader>q :q<CR>
nnoremap <Leader>Q :qa!<CR>

" 定义快捷键在结对符之间跳转
nnoremap <Leader>M %
" kj 替换 Esc
inoremap kj <Esc>


"==========================================
" Load file config
"==========================================

" Python Stuffs
if filereadable(expand("~/.vim/ftplugin/python.vim"))
    source ~/.vim/ftplugin/python.vim
endif
" Html Stuffs
if filereadable(expand("~/.vim/ftplugin/frontend.vim"))
    source ~/.vim/ftplugin/frontend.vim
endif
" markwodn Stuffs
if filereadable(expand("~/.vim/ftplugin/markdown.vim"))
    source ~/.vim/ftplugin/markdown.vim
endif
" newfile Stuffs
if filereadable(expand("~/.vim/ftplugin/newfile.vim"))
    source ~/.vim/ftplugin/newfile.vim
endif
" runit Stuffs
if filereadable(expand("~/.vim/ftplugin/runit.vim"))
    source ~/.vim/ftplugin/runit.vim
endif


"==========================================
" custom script
"==========================================

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

inoremap <Tab> <c-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <c-n>


"==========================================
" Plugin config
"==========================================

" ====> Theme <====
if has('gui_running')
    set background=light
    colorscheme solarized
else
    set background=dark
    colorscheme molokai
endif

" ====> Tagbar <====
let g:tagbar_width=35
let g:tagbar_autofocus=1
nnoremap <Leader>t :TagbarToggle<CR>

" ====> ale <====
" default pylint
let g:ale_linters = {
\   'python': ['flake8'],
\}
let g:ale_sign_column_always = 1
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
highlight ALEErrorSign ctermfg=197 ctermbg=NONE cterm=NONE
highlight ALEWarningSign ctermfg=192 ctermbg=NONE cterm=NONE
highlight SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE

" ====> Nerd Tree <====
let NERDChristmasTree=0
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nnoremap <Leader>fl :NERDTreeToggle<CR>
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 打开文件后关闭File Tree
" let NERDTreeQuitOnOpen=1
" Automatically open a NERDTree if no files where specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nnoremap <Leader>f :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
fun! ToggleNERDTreeWithRefresh()
    :NERDTreeToggle
    if(exists("b:NERDTreeType") == 1)
        call feedkeys("R")
    endi
endf
nnoremap <silent> <Leader>r :call ToggleNERDTreeWithRefresh()<CR>

" ====> Ctrlp <====
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" let g:ctrlp_custom_ignore = '\v\.(exe|so|dll)$'
let g:ctrlp_extensions = ['funky']
" 显示折叠代码的文档字符串
let g:SimpylFold_docstring_preview=1

" ====> Indent Guides <====
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
nnoremap <silent> <Leader>i <Plug>IndentGuidesToggle

" ====> Ctrlsf <====
" 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>

" ====> YCM <====
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
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228))
set completeopt=longest,menu
" 离开插入模式后自动关闭预览窗口"
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
" 在注释输入中也能补全
let g:ycm_complete_in_comments=1
" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings=0
let g:ycm_complete_in_strings=1
let g:syntastic_always_populate_loc_list=1
let g:ycm_autoclose_preview_window_after_completion=1
" Switch between the last two files
nnoremap <leader><leader> <c-^>
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" youcompleteme  默认tab  s-tab 和 ultisnips 冲突
let g:ycm_key_list_select_completion=['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<c-p>', '<Up>']
let g:ycm_filetype_blacklist = {
            \ 'tagbar' : 1,
            \ 'nerdtree' : 1,
            \}

" ====> Ultisnips <====
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ====> Rainbow <====
let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
            " 不加入这行, 防止黑色括号出现, 很难识别
            " \ ['black',       'SeaGreen3'],
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" ====> Vim Multple cursor <====
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-m>'
" let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" 修复ctrl+m
" 多光标操作选择的bug，但是改变了ctrl+v进行字符选中时将包含光标下的字符
set selection=inclusive
set selectmode=mouse,key

" ====> Vim easy align <====
vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
    let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }

" ====> quick run <====
let g:quickrun_config = {
            \   "_" : {
            \       "outputter" : "message",
            \   },
            \}
let g:quickrun_no_default_key_mappings = 1
nmap <Leader>r <Plug>(quickrun)
map <F10> :QuickRun<CR>

" ====> Vim expand region <====
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" ====> nerdcommenter <====
" <leader>cc   加注释
" <leader>cu   解开注释
" <leader>c<space>  加上/解开注释, 智能判断
" <leader>cy   先复制, 再注解(p可以进行黏贴)
" 注释的时候自动加个空格, 强迫症必配
" let g:NERDSpaceDelims=1

" ====> airline <====
" 启动显示状态行(1),总是显示状态行(2)
set laststatus=2
if !exists('g:airline_powerline_fonts')
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.whitespace = 'Ξ'
    let g:airline_left_sep = '▶'
    let g:airline_left_alt_sep = '❯'
    let g:airline_right_sep = '◀'
    let g:airline_right_alt_sep = '❮'
endif
" 是否打开tabline
"let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='molokai'
let g:airline_section_error = '%{exists("ALEGetStatusLine") ? ALEGetStatusLine() : ""}'

" ====> isort <====
" Shift-V 上下选中, ctrl + i 规范化
let g:vim_isort_map = '<C-i>'

" ====> React Native <====
let g:jsx_ext_required = 0
