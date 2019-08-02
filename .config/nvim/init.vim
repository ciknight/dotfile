" ######################################################################################################################
" ### Author : CI_Knight ci_knight@msn.cn>                                                                           ###
" ######################################################################################################################
" ### Neovim Configuration focused on Python development                                                             ###
" ### Neovimmer since : Jan 2018                                                                                     ###
" ### Vimmer since    : Nov 2015                                                                                     ###
" ######################################################################################################################

" ======================================================================================================================
" 1.0 Plugin manager (Plug) settings
" ======================================================================================================================
"{{{

" Autoinstall {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup plug_install
    autocmd VimEnter * PlugInstall
  augroup END
endif
" }}}

call plug#begin('~/.config/nvim/plugged')

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" 1.1 Plugin list
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ---------------------------------------------------------------------------------------------------------------------
" Language agnostic plugins {{{
" ---------------------------------------------------------------------------------------------------------------------

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Deoplete Plugins
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make' }
Plug 'fszymanski/deoplete-emoji'
Plug 'ujihisa/neco-look'

Plug 'davidhalter/jedi-vim'  " Usage goto jump
" Snippet engine (C-j)
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine.
Plug 'honza/vim-snippets'
" Automatically pair stuff
Plug 'jiangmiao/auto-pairs'
if has('nvim-0.4.0')
  Plug 'ncm2/float-preview.nvim'
endif
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Other languages {{{
" ---------------------------------------------------------------------------------------------------------------------

" Syntax check
Plug 'w0rp/ale' ", { 'do': 'pip install flake8 mypy isort yapf' }
" Golang syntax
Plug 'fatih/vim-go', { 'for': 'go', 'on': 'GoInstallBinaries', 'tag': '*' }
" Python automate format
Plug 'mindriot101/vim-yapf'
" Python auto breakpoint
Plug 'ciknight/setbreakpoint'
" Python auto set venv
Plug 'ciknight/python-venv'
" Python sort import
Plug 'fisadev/vim-isort'
" Solidity syntax
Plug 'tomlion/vim-solidity'
" Kotlin
Plug 'udalov/kotlin-vim'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Interface improving {{{
" ---------------------------------------------------------------------------------------------------------------------

" Nerdtree file browser
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
" Nerdtree git extend
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'ryanoasis/vim-devicons'  " Icon
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Matchit enhances jump motions, Improved % matching
Plug 'tmhedberg/matchit'
" Use V or v, easily expand region selected
Plug 'terryma/vim-expand-region'
" Vim-Multiple-Cursors
Plug 'terryma/vim-multiple-cursors'
Plug 'bfredl/nvim-miniyank'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" External tools integration plugins {{{
" ---------------------------------------------------------------------------------------------------------------------

" Auto create not exists dir
Plug 'pbrisbin/vim-mkdir'
" Rainbow pair
Plug 'kien/rainbow_parentheses.vim'
" Indent line
Plug 'Yggdroot/indentLine'
" Ag wrapper search and edit
Plug 'dyng/ctrlsf.vim', { 'on': ['CtrlSF', 'CtrlSFToggle'] }  " similar to ack.vim
" Git swiss-army knife
Plug 'tpope/vim-fugitive'
" Git changes showed on line numbers
Plug 'airblade/vim-gitgutter'
" Class/module browser, ctag support, suppoer powerline
Plug 'majutsushi/tagbar'
" Auto filejump
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Quick annotation
Plug 'scrooloose/nerdcommenter'
" Motions on speed
Plug 'easymotion/vim-easymotion'
" Wrapper of some vim/neovim's :terminal functions.
Plug 'kassio/neoterm'
"Plug 'myusuf3/numbers.vim'
Plug 'junegunn/goyo.vim'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Text insertion/manipulation {{{
" ---------------------------------------------------------------------------------------------------------------------

" Surround (cs"')
Plug 'tpope/vim-surround'  " yss, cs, ysiw
" Easy alignment, Use :Tab\"
Plug 'godlygeek/tabular', { 'on':  'Tabularize' }  " junegunn/vim-easy-align
" Show content of registers when pasting
"Plug 'junegunn/vim-peekaboo'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Colorschemes {{{
" ---------------------------------------------------------------------------------------------------------------------

Plug 'icymind/NeoSolarized'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Other {{{
" ---------------------------------------------------------------------------------------------------------------------

" More . repeat functionality
Plug 'tpope/vim-repeat'
" Did you mean file open
Plug 'EinfachToll/DidYouMean'
"}}}

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" 1.2 End of plugin declaration
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
call plug#end()
"}}}

" ======================================================================================================================
" 2.0 Basic settings (Neovim defaults: https://neovim.io/doc/user/vim_diff.html#nvim-option-defaults) {{{
" ======================================================================================================================
"{{{

set encoding=utf-8                          " The encoding displayed.
set fileencoding=utf-8                      " The encoding written to file.
set termencoding=utf-8
scriptencoding utf-8                        " Set utf-8 as default script encoding

set shell=/bin/zsh                          " Setting shell to zsh
set showmode                                " Always show mode
set showcmd                                 " Show commands as you type them
"set textwidth=100                          " Text width is 100 characters
set cmdheight=1                             " Command line height
set pumheight=10                            " Completion window max size
set hidden                                  " Enables to switch between unsaved buffers and keep undo history
set clipboard^=unnamed,unnamedplus          " Allow to use system clipboard
set lazyredraw                              " Don't redraw while executing macros (better performance)
set showmatch                               " Show matching brackets when text indicator is over them
set matchtime=2                             " How many tenths of a second to blink when matching brackets
set nostartofline                           " Prevent cursor from moving to beginning of line when switching buffers
set virtualedit=block                       " To be able to select past EOL in visual block mode
set nojoinspaces                            " No extra space when joining a line which ends with . ? !
set scrolloff=5                             " Scroll when closing to top or bottom of the screen
set updatetime=1000                         " Update time used to create swap file or other things
set suffixesadd+=.js,.rb                    " Add js and ruby files to suffixes
set synmaxcol=200                           " Don't try to syntax highlight minified files
set expandtab                               " Tab转换为空格
set smarttab
set smartindent                             " 更加智能的缩进，当遇到缩进不为整数与上对齐
set mouse-=a                                " 鼠标暂不启用，a 是所有模式下
set nowrap                                  " 不自动折行
set viminfo+=!                              " 保存全局变量
set softtabstop=4                           " 让 vim 把连续数量的空格视为一个制表符
set shiftwidth=4                            " 设置格式化时制表符占用空格数
set tabpagemax=15                           " Only show 15 tabs
set tabstop=4                               " 每四行一个缩进
set shiftround

set number                                  " Line numbers on
set numberwidth=1
set relativenumber
set cursorline cursorcolumn
augroup relative_numbser                    " 插入模式下用绝对行号, 普通模式下用相对
  autocmd!
  autocmd InsertEnter * :set norelativenumber number
  autocmd InsertLeave * :set relativenumber
augroup END
augroup auto_hightlight                     " 高亮当前行
  autocmd!
  autocmd WinEnter * set cursorline cursorcolumn
  autocmd WinLeave * set nocursorline nocursorcolumn
augroup END
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.1 Split settings (more natural) {{{
" ---------------------------------------------------------------------------------------------------------------------
set splitbelow                              " Splitting a window will put the new window below the current
set splitright                              " Splitting a window will put the new window right of the current
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.2 Timeout settings {{{
" ---------------------------------------------------------------------------------------------------------------------
" Time out on key codes but not mappings. Basically this makes terminal Vim work sanely. (by Steve Losh)
set notimeout
set ttimeout
set ttimeoutlen=10
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.3 Spelling settings {{{
" ---------------------------------------------------------------------------------------------------------------------
set spellfile=~/.config/nvim/dictionary.utf-8.add
set spelllang=en_us                         " Set language to US English
set nospell                                 " Disable checking by default (use <F4> to toggle)
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.4 Search settings {{{
" ---------------------------------------------------------------------------------------------------------------------
set ignorecase                              " Ignore case by default
set smartcase                               " Make search case sensitive only if it contains uppercase letters
set wrapscan                                " Search again from top when reached the bottom
set incsearch                               " do incremental searching
set hlsearch                                " 检索时高亮显示匹配项
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.5 Persistent undo settings {{{
" ---------------------------------------------------------------------------------------------------------------------
if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp/undo//
endif
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.6 White characters settings {{{
" ---------------------------------------------------------------------------------------------------------------------
set list                                  " Show listchars by default
set listchars=tab:»·,trail:·              " Display extra whitespace
set iskeyword+=_,$,@,%,#,-                " 带有如下符号的单词不要被换行分割
"set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·,nbsp:·
"set showbreak=↪
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.7 Filetype settings {{{
" ---------------------------------------------------------------------------------------------------------------------
filetype plugin on
filetype indent on
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.8 Folding settings {{{
" ---------------------------------------------------------------------------------------------------------------------
set foldenable
set foldmethod=marker                       " Markers are used to specify folds.
set foldlevel=2                             " Start folding automatically from level 2
set fillchars="fold: "                      " Characters to fill the statuslines and vertical separators
set nofoldenable                            " 启动 vim 时关闭折叠代码
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.9 Omni completion settings {{{
" ---------------------------------------------------------------------------------------------------------------------
setlocal omnifunc=                          " disable omnifunc
set completeopt-=preview                    " Don't show preview scratch buffers
set nocompatible                            " 禁用Vi的兼容模式,去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set laststatus=2
set wildmenu                                " Tab自动补全时，单行菜单形式显示
set wildmode=longest,list
set wildignore=*.o,*.obj,*~                 " MacOSX/Linux, not support Windows
set wildignore+=*.so,*.swp,*.zip,*.png,*.jpg,*.gif
set wildignore+=*vim/backups*
set wildignore+=*.pyc,                      " include __pycache__
set wildignore+=*DS_Store*
set wildignore+=tmp/**,*/tmp/*
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.10 Neovim specific settings {{{
" ---------------------------------------------------------------------------------------------------------------------
if has('nvim')
  let g:loaded_python_provider=1                                   " Disable python 2 interface
  let g:python_host_skip_check=1                                   " Skip python 2 host check
  let g:python3_host_prog=$HOME.'/workspace/neovim3/bin/python'    " Set python 3 host program, using virtualenv
  set inccommand=nosplit                                           " Live preview of substitutes and other similar commands
endif
"}}}

" -----------------------------------------------------
" 2.11 True colors settings {{{
" -----------------------------------------------------
if has('termguicolors')
  set termguicolors " Turn on true colors support
endif
"}}}

" -----------------------------------------------------
" 2.12 Language settings {{{
" -----------------------------------------------------
let $LANG="zh_CN.utf-8"
"}}}

" -----------------------------------------------------
" 2.13 File settings {{{
" -----------------------------------------------------
set fileformat=unix
set nobackup                                " no file backup
set noswapfile                              " New buffers will be loaded without creating a swapfile
set confirm                                 " Need confrimation while exit
set autowrite                               " Automatically :write before running commands
set autoread                                " Set to auto read when a file is changed from the outside
set autowriteall
cmap w!! w !sudo tee % > /dev/null          " Allow saving file as sudo when forgot to start vim using sudo
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.14 Ident settings {{{
" ---------------------------------------------------------------------------------------------------------------------
autocmd FileType python setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType go setlocal shiftwidth=4 tabstop=4
autocmd FileType javascript,sql,json,html,xhtml,css,xml,yaml,yml,vim setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType markdown setlocal fo-=t wrap
"}}}

"}}}

" ======================================================================================================================
" 3.0 Mapping settings
" ======================================================================================================================
"{{{

" -----------------------------------------------------
" 3.1 Setting leader {{{
" -----------------------------------------------------
"let g:mapleader="\<space>"
let mapleader = ","
set timeoutlen=500  " wait leader
"}}}

" -----------------------------------------------------
" 3.2 Disabling arrow keys, space key {{{
" with Q key, help with F1.
" -----------------------------------------------------
inoremap <F1> <NOP>
nnoremap <F1> <NOP>
"nnoremap <bs> <NOP>
"nnoremap <delete> <NOP>
"nnoremap <Space> <NOP>
"nnoremap Q <NOP>

"nnoremap <up> <NOP>
"nnoremap <down> <NOP>
"nnoremap <left> <NOP>
"nnoremap <right> <NOP>

"vnoremap <up> <NOP>
"vnoremap <down> <NOP>
"vnoremap <left> <NOP>
"vnoremap <right> <NOP>

"}}}

" -----------------------------------------------------
" 3.3 Vim defaults overriding {{{
" -----------------------------------------------------

" Easier window switching NerdTree, TagBar, Terminal.
nmap <silent> <C-w><C-w> :call utils#intelligentCycling()<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Visual linewise up and down by default (and use gj gk to go quicker)
nnoremap j gj
nnoremap k k
nnoremap gj 5j
nnoremap gk 5k
vnoremap j gj
vnoremap k gk
vnoremap gj 5j
vnoremap gk 5k

" When jump to next match also center screen
" Note: Use :norm! to make it count as one command. (i.e. for i_CTRL-o)
nnoremap <silent> n :norm! nzz<CR>
nnoremap <silent> N :norm! Nzz<CR>
vnoremap <silent> n :norm! nzz<CR>
vnoremap <silent> N :norm! Nzz<CR>

" Same when moving up and down
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
vnoremap <C-u> <C-u>zz
vnoremap <C-d> <C-d>zz
vnoremap <C-f> <C-f>zz
vnoremap <C-b> <C-b>zz

" Remap H and L (top, bottom of screen to left and right end of line)
"nnoremap H ^
"nnoremap L $
"vnoremap H ^
"vnoremap L g_

" More logical Y (default was alias for yy)
nnoremap Y y$

" Quick replay 'q' macro
nnoremap Q @q

" Don't yank to default register when changing something
nnoremap c "xc
xnoremap c "xc

" After block yank and paste, move cursor to the end of operated text and don't override register
"vnoremap y y`]
"vnoremap p "_dP`]
"nnoremap p p`]

" Fix the cw at the end of line bug default vim has special treatment (:help cw)
nmap cw ce
nmap dw de
nmap yw ye

" Uppercase word in insert mode
inoremap <C-u> <ESC>mzgUiw`za

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <C-c> <C-[>
inoremap <Esc> <C-[>
nnoremap <C-c> <C-[>
nnoremap <Esc> <C-[>

" Matching brackets with TAB (using matchit) (Breaks the <C-i> jump)
map <TAB> %
silent! unmap [%
silent! unmap ]%

" Don't cancel visual select when shifting
xnoremap <  <gv
xnoremap >  >gv

" Stay down after creating fold
vnoremap zf mzzf`zzz

" Easier fold toggling
nnoremap <space> za
"}}}

" -----------------------------------------------------
" 3.4 Common tasks {{{
" -----------------------------------------------------

" Quick save and close buffer
nnoremap <leader>w :w<CR>
nnoremap <silent> <leader>q :q<CR>
nnoremap <Leader>Q :qa!<CR>

nnoremap <leader>o o<Esc>
nnoremap <leader>O o<Esc>o<Esc>

" Yank and paste from clipboard
"nnoremap <leader>y "+y
"vnoremap <leader>y "+y
"nnoremap <leader>yy "+yy
"nnoremap <leader>p "+p

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Tab navigation
nnoremap ]t :tabn<CR>
nnoremap [t :tabp<CR>

" QuickFix navigation
"nnoremap ]q :cnext<CR>
"nnoremap [q :cprevious<CR>

" Location list navigation
nnoremap ]l :lnext<CR>
nnoremap [l :lprevious<CR>

" Error mnemonic (Neomake uses location list)
nnoremap ]e :lnext<CR>
nnoremap [e :lprevious<CR>

" Reselect last-pasted text
nnoremap gp `[v`]

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" [S]plit line (sister to [J]oin lines) S is covered by cc.
nnoremap S mzi<CR><ESC>`z

" Start substitute on current word under the cursor
"nnoremap <leader>s :%s///gc<Left><Left><Left>

" Faster sort
"vnoremap <leader>s :!sort<CR>

" Start search on current word under the cursor
"nnoremap <leader>/ /<CR>

" Start reverse search on current word under the cursor
"nnoremap <leader>? ?<CR>

" Fix spelling error on the go
inoremap <C-l> <C-g>u<ESC>[s1z=`]a<C-g>u

" Toggle search highlight
" nnoremap <leader>/ :set nohlsearch!<CR> :set nohlsearch?<CR>  " 取消高亮，再搜索会有bug
nnoremap <leader>/ :let @/=""<CR>
"}}}

" -----------------------------------------------------
" 3.5 F-key actions {{{
" -----------------------------------------------------
" Free
"nnoremap <silent> <F1>
" NERDTree wrapper
nnoremap <silent> <F2> :call utils#nerdWrapper()<CR>
" Free
nnoremap <silent> <F3> :call utils#TabBar()<CR>
" Toggle spelling
nnoremap <silent> <F4> :set spell!<CR> :set spell?<CR>
" Free
" nnoremap <silent> <F5>
" Free
" nnoremap <silent> <F6>
" Toggle white characters visibility
nnoremap <silent> <F7> :set list!<CR> :set list?<CR>
" New term buffer
nnoremap <silent> <F8> :terminal<CR>
" Fire REST Request
" Free
" nnoremap <silent> <F9>
" Free
" nnoremap <silent> <F10>
" Free
" nnoremap <silent> <F11>
" Informative echo
nnoremap <F12> :call utils#showToggles()<CR>

"}}}

" -----------------------------------------------------
" 3.6 Window / Buffer management {{{
" -----------------------------------------------------

" Intelligent windows resizing using ctrl + arrow keys
"nnoremap <silent> <C-Right> :call utils#intelligentVerticalResize('right')<CR>
"nnoremap <silent> <C-Left> :call utils#intelligentVerticalResize('left')<CR>
"nnoremap <silent> <C-Up> :resize +1<CR>
"nnoremap <silent> <C-Down> :resize -1<CR>

" Buffers navigation and management
nnoremap <silent> + :bn<CR>
nnoremap <silent> _ :bp<CR>
"}}}

" Switch alternate file, http://vim.wikia.com/wiki/Go_to_alternate_file_or_next_file_if_no_alternate
nnoremap <silent> <leader>, <C-^>

" -----------------------------------------------------
" 3.7 Command abbreviations and mappings {{{
" -----------------------------------------------------

" Quiting and saving all, command :
cnoremap ww wqall
cnoremap qq qall
"}}}

" -----------------------------------------------------
" 3.8 Custom commands and functions {{{
" -----------------------------------------------------

" Reformat whole or selection from file
"command! Format :call utils#formatFile()
"nnoremap <silent> <leader>f :Format<CR>

" Profile
command! Profile :call utils#profile()

" Retab
command! Retab :call utils#retabToFourSpaces()
command! Retab2 :call utils#retabToTwoSpaces()

" Python breakpoint
autocmd! FileType python nnoremap <leader>b :call ToggleBreakPoint()<Cr>
"}}}

"}}}

" ======================================================================================================================
" 4.0 Plugins settings
" ======================================================================================================================
"{{{

" -----------------------------------------------------
" 4.1 NERDTree {{{
" -----------------------------------------------------
let g:NERDTreeWinSize=32
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$', '__pycache__']
let g:NERDTreeWinPos="left"
let g:NERDTreeMinimalUI=1
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeShowHidden=1
let g:NERDTreeHighlightCursorline=0
let g:NERDTreeRespectWildIgnore=1
let g:nerdtree_tabs_open_on_console_startup=1
let g:NERDTreeQuitOnOpen=1
" Automatically open a NERDTree if no files where specified
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTreeToggle | endif
" Close vim if the only window left open is a NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"}}}

" -----------------------------------------------------
" 4.2 Ultisnips settings {{{
" -----------------------------------------------------
let g:UltiSnipsUsePythonVersion=3
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"}}}

" -----------------------------------------------------
" 4.3 Gitgutter settings {{{
" -----------------------------------------------------
if exists('&signcolumn')
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

let g:gitgutter_sign_added='+'
let g:gitgutter_sign_modified='~'
let g:gitgutter_sign_removed='-'
let g:gitgutter_sign_modified_removed='~'
let g:gitgutter_sign_removed_first_line='-'

let g:gitgutter_async=1
let g:gitgutter_map_keys=0
let g:gitgutter_max_signs=9999
"}}}

" -----------------------------------------------------
" 4.4 airline settings {{{
" -----------------------------------------------------
if empty(glob('~/.fonts/README.rst'))
  let g:airline_powerline_fonts=0
else
  let g:airline_powerline_fonts=1
endif
if !exists('g:airline_powerline_fonts')
    if !exists('g:airline_symbols')
        let g:airline_symbols={}
    endif
    let g:airline_symbols.linenr='␊'
    let g:airline_symbols.linenr='␤'
    let g:airline_symbols.linenr='¶'
    let g:airline_symbols.branch='⎇'
    let g:airline_symbols.paste='Þ'
    let g:airline_symbols.whitespace='Ξ'
    let g:airline_left_sep='▶'
    let g:airline_left_alt_sep='❯'
    let g:airline_right_sep='◀'
    let g:airline_right_alt_sep='❮'
endif
" 是否打开tabline
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='minimalist' " molokai
"}}}

" -----------------------------------------------------
" 4.4 FZF {{{
" -----------------------------------------------------

" Floating Windows function
function! OpenFloatingWin()
  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  " 设置浮动窗口打开的位置，大小等。
  " 这里的大小配置可能不是那么的 flexible 有继续改进的空间
  let opts = {
        \ 'relative': 'editor',
        \ 'row': height * 0.3,
        \ 'col': col + 30,
        \ 'width': width * 2 / 3,
        \ 'height': height / 2
        \ }

  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)

  " 设置浮动窗口高亮
  call setwinvar(win, '&winhl', 'Normal:Pmenu')

  setlocal
        \ buftype=nofile
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }
if has('nvim-0.4.0')
  let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }
endif

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
"}}}

" -----------------------------------------------------
" 4.5 Rainbow settings {{{
" -----------------------------------------------------
let g:rbpt_colorpairs=[
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
let g:rbpt_max=16
let g:rbpt_loadcmd_toggle=0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"}}}

" -----------------------------------------------------
" 4.6 Deoplete autocomplete settings {{{
" -----------------------------------------------------
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_smart_case=1
let g:deoplete#enable_refresh_always=1
let g:deoplete#file#enable_buffer_path=1

let g:deoplete#sources#jedi#server_timeout=10
let g:deoplete#sources#jedi#enable_cache=1
let g:deoplete#sources#jedi#statement_length=70
let g:deoplete#sources#jedi#enable_typeinfo=1
let g:deoplete#sources#jedi#show_docstring=1

"let deoplete#sources#jedi#python_path=''  # jedi server python path
"let g:deoplete#sources#jedi#extra_path=''  # sys.path, auto reload jedi

let g:deoplete#sources#go#gocode_binary=$GOPATH.'/bin/gocode-gomod'
let g:deoplete#sources#go#sort_class=['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#pointer=1
let g:deoplete#sources#go#use_cache=1
"let g:deoplete#sources#go#auto_goos=1
"let g:deoplete#sources#go#builtin_objects=1
"let g:deoplete#sources#go#source_importer=1
"let g:deoplete#sources#go#unimported_packages=1

let g:deoplete#sources={}
let g:deoplete#sources._=['around', 'buffer', 'member', 'file', 'ultisnips']
let g:deoplete#sources.python=['jedi', 'around', 'buffer', 'member', 'file', 'ultisnips']
let g:deoplete#sources.go=['go', 'around', 'buffer', 'member', 'file', 'ultisnips']
call deoplete#custom#source('emoji', 'filetypes', ['rst', 'gitcommit', 'markdown'])

let g:float_preview#docked=0
"}}}

" -----------------------------------------------------
" 4.7 Ctrl-SF settings {{{
" -----------------------------------------------------
let g:ctrlsf_default_root='project'
let g:ctrlsf_populate_qflist=0
let g:ctrlsf_position='bottom'
let g:ctrlsf_winsize='30%'
let g:ctrlsf_auto_close=0
let g:ctrlsf_regex_pattern=0
let g:ctrlsf_search_mode='async'
"let g:ctrlsf_extra_root_markers=['.root']
"}}}

" -----------------------------------------------------
" 4.8 Plug settings {{{
" -----------------------------------------------------
let g:plug_timeout=20
"}}}

" -----------------------------------------------------
" 4.9 Colorizer settings {{{
" -----------------------------------------------------
let g:colorizer_nomap=1
"}}}

" -----------------------------------------------------
" 4.10 vim-go settings {{{
" -----------------------------------------------------
let g:go_autodetect_gopath=1
let g:go_version_warning=1
"}}}

" -----------------------------------------------------
" 4.11 ale {{{
" -----------------------------------------------------
let g:ale_linters={
\   'vim' : ['vint'],
\   'python' : ['flake8', 'mypy'],
\   'markdown' : ['mdl'],
\   'sh' : ['shellcheck'],
\   'javascript' : ['eslint'],
\}
let g:ale_fixers = {
\   '*': [
\     'trim_whitespace',
\     'remove_trailing_lines',
\   ],
\   'python': [
\     'isort',
\     'yapf'
\   ]
\}
let g:ale_lint_on_text_changed='always'  " never,always
let g:ale_lint_on_save=1
let g:ale_fix_on_save=1
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter=1
let g:ale_sign_column_always=1
let g:ale_set_highlights=1

let g:ale_sign_error='•'
let g:ale_sign_warning='•'
let g:ale_echo_msg_error_str='E'
let g:ale_echo_msg_warning_str='W'
let g:ale_echo_msg_format='[%linter%] %code% %s [%severity%]'

set statusline=%{utils#LinterStatus()}
"}}}

" -----------------------------------------------------
" 4.12 Yapf {{{
" -----------------------------------------------------
let g:yapf_style=$HOME."/.config/yapf/style"
"}}}

" -----------------------------------------------------
" 4.13 Nerdcommenter {{{
" -----------------------------------------------------
" <leader>cc   加注释
" <leader>cu   解开注释
" <leader>c<space>  加上/解开注释, 智能判断
" Add spaces after comment delimiters by default
"let g:NERDSpaceDelims=1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs=1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign='left'
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters={ 'c': { 'left': '/**','right': '*/' } }
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines=1
"}}}

" -----------------------------------------------------
" 4.13 jedi-vim {{{
" -----------------------------------------------------
let g:jedi#auto_initialization=1
let g:jedi#auto_vim_configuration=0
let g:jedi#completions_enabled=0
let g:jedi#smart_auto_mappings=0
let g:jedi#popup_on_dot=0
let g:jedi#popup_select_first=0
let g:jedi#auto_close_doc=1
let g:jedi#force_py_version=3  " fix autojump to site-packages, davidhalter/jedi-vim/issues/744
"}}}

"}}}

" ======================================================================================================================
" 5.0 Plugin mappings
" ======================================================================================================================
"{{{

" -----------------------------------------------------
" 5.1 Ultisnips {{{
" -----------------------------------------------------
" Disable built-in cx-ck to be able to go backward
"inoremap <C-x><C-k> <NOP>
let g:UltiSnipsExpandTrigger="<C-j>"  " do not use tab, if you use deoplete and ycm
let g:UltiSnipsListSnippets="<C-s>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
"}}}

" -----------------------------------------------------
" 5.2 Gitgutter {{{
" -----------------------------------------------------
nnoremap [h :GitGutterPrevHunk<CR>
nnoremap ]h :GitGutterNextHunk<CR>
nnoremap ,hs :GitGutterStageHunk<CR>
nnoremap ,hr :GitGutterRevertHunk<CR>
"}}}

" -----------------------------------------------------
" 5.3 Expand region {{{
" -----------------------------------------------------
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
"}}}

" -----------------------------------------------------
" 5.4 Deoplete autocomplete {{{
" -----------------------------------------------------
" Insert <TAB> or select next match
inoremap <silent> <expr> <Tab> utils#tabComplete()

" Manually trigger tag autocomplete
inoremap <silent> <expr> <C-]> utils#manualTagComplete()

" <C-h>, <BS>: close popup and delete backword char
inoremap <expr><C-h> deolete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
"}}}

" -----------------------------------------------------
" 5.5 CtrlSF {{{
" -----------------------------------------------------
"nnoremap <leader>g :CtrlSF<Space>
"nnoremap <leader>G :CtrlSFToggle<Space>
let g:ctrlsf_mapping = {
      \ 'next'    : 'n',
      \ 'prev'    : 'N',
      \ 'quit'    : 'q',
      \ 'openb'   : '',
      \ 'split'   : 's',
      \ 'tab'     : '',
      \ 'tabb'    : '',
      \ 'popen'   : '',
      \ 'pquit'   : '',
      \ 'loclist' : '',
      \ }
nnoremap <silent> <leader>gs :call utils#searchCurrentWordWithAg()<CR>
"}}}

" -----------------------------------------------------
" 5.6 ale {{{
" -----------------------------------------------------
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
"}}}

" -----------------------------------------------------
" 5.7 Tabularize -> [a]lign {{{
" -----------------------------------------------------
vnoremap <leader>a :Tabularize /
"}}}

" -----------------------------------------------------
" 5.8 vim-multiple-cursors {{{
" -----------------------------------------------------
let g:multi_cursor_use_default_mapping=1

" Default mapping
let g:multi_cursor_start_word_key      = '<C-m>'
let g:multi_cursor_select_all_word_key = '<A-m>'
let g:multi_cursor_start_key           = 'g<C-m>'
let g:multi_cursor_select_all_key      = 'g<A-m>'
let g:multi_cursor_next_key            = '<C-m>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
"}}}


" -----------------------------------------------------
" 5.9 jedi-vim {{{
" -----------------------------------------------------
let g:jedi#goto_command="<leader>gg"
let g:jedi#goto_assignments_command="<leader>ga"
let g:jedi#goto_definitions_command="<leader>gd"
let g:jedi#documentation_command="K"
let g:jedi#usages_command="<leader>gu"
let g:jedi#rename_command="<leader>gr"
"}}}

" -----------------------------------------------------
" 5.10 FZF {{{
" -----------------------------------------------------
nnoremap <Leader>p :FZF<Cr>
"}}}

" -----------------------------------------------------
" 5.11 easymotion {{{
" -----------------------------------------------------
map <Leader> <Plug>(easymotion-prefix)

" <Leader>w{char} to move to {char}
"map  <Leader>w <Plug>(easymotion-bd-f)
"nmap <Leader>w <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
"nmap s <Plug>(easymotion-overwin-f2)

" Move to line
"map <Leader>L <Plug>(easymotion-bd-jk)
"nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>f <Plug>(easymotion-bd-w)
nmap <Leader>f <Plug>(easymotion-overwin-w)
"}}}

" -----------------------------------------------------
" 5.12 vim-miniyank {{{
" -----------------------------------------------------
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
"}}}

" -----------------------------------------------------
" 5.13 vim-surround {{{
" -----------------------------------------------------
" ysiwb
" yssb
" dsb
" csb
"}}}

"}}}

" ======================================================================================================================
" 6.0 Color and highlighting settings
" ======================================================================================================================
"{{{
" Syntax highlighting {{{
syntax on
"}}}

" Color scheme {{{
set background=dark
colorscheme NeoSolarized
"}}}

" Highlight VCS conflict markers {{{
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
"}}}

" Highlight term cursor differently {{{
highlight TermCursor ctermfg=green guifg=green
"}}}

" Remove underline in folded lines {{{
highlight! Folded term=NONE cterm=NONE gui=NONE ctermbg=NONE
"}}}

" Link highlight groups to improve buftabline colors {{{
hi! link BufTabLineCurrent Identifier
hi! link BufTabLineActive Comment
hi! link BufTabLineHidden Comment
hi! link BufTabLineFill Comment
"}}}

"}}}

" ======================================================================================================================
" 7.0 Autocommands
" ======================================================================================================================
"{{{

" Keywordprg settings {{{
augroup vim_man
  autocmd FileType vim setlocal keywordprg=:help
augroup END
"}}}

" Turn spellcheck on for text files {{{
augroup auto_spellcheck
  autocmd BufNewFile,BufRead *.txt,*.md setlocal spell
augroup END
"}}}

" Remove trailing whitespaces automatically before save {{{
" use ale
"augroup strip_ws
"  autocmd BufWritePre * call utils#stripTrailingWhitespaces()
"augroup END
"}}}

" Resize splits when the window is resized {{{
augroup resize_improvements
  autocmd VimResized * :wincmd =
augroup END
"}}}

" Make sure Vim returns to the same line when you reopen a file. Thanks, Amit and Steve Losh. {{{
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END
"}}}

" Run checktime in buffers, but avoiding the "Command Line" (q:) window
augroup prevent_q_colon
  autocmd CursorHold * if getcmdwintype() == '' | checktime | endif
augroup END

" Auto Set File Title
augroup set_file_title
  autocmd BufNewFile *.cpp,*.sh,*.rb,*.java,*.py,*.c,*.h,*.lua call utils#SetFileTitle()
augroup END

" -----------------------------------------------------
" 7.1 Run something after save {{{
" -----------------------------------------------------
"augroup linters
"  " npm install -g eslint
"  autocmd BufWritePost *.js Neomake eslint
"augroup END
"}}}

"}}}

" ======================================================================================================================
" 8.0 Todo, Notes
" ======================================================================================================================
"{{{

" -----------------------------------------------------
" 8.1 Todo {{{
" -----------------------------------------------------
" 1. Update README file.
"}}}

" -----------------------------------------------------
" 8.2 Notes {{{
" -----------------------------------------------------
"}}}

"}}}
