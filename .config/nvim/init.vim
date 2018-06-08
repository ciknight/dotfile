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
" Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi-vim'

" Automatically closing pair stuff
Plug 'cohama/lexima.vim'
" Snippet support (C-j)
"Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
"Plug 'honza/vim-snippets'
" Commenting support (gc)
Plug 'tpope/vim-commentary'
" Heuristically set indent settings
Plug 'tpope/vim-sleuth'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Other languages {{{
" ---------------------------------------------------------------------------------------------------------------------

" Syntax check
Plug 'w0rp/ale', {'do': 'pip install flake8 mypy isort yapf'}
" Yaml indentation
Plug 'martin-svk/vim-yaml'
" Git syntax
Plug 'tpope/vim-git'
" Tmux syntax
Plug 'keith/tmux.vim'
" Shell syntax
Plug 'Shougo/vimshell.vim'
" Golang syntax
Plug 'fatih/vim-go', {'for': 'go', 'on': 'GoInstallBinaries'}
" Python automate format
Plug 'ciknight/vim-yapf'
" Solidity syntax
Plug 'tomlion/vim-solidity'
" Python sort import
Plug 'fisadev/vim-isort'
" TypeScript syntax
Plug 'leafgarland/typescript-vim'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Interface improving {{{
" ---------------------------------------------------------------------------------------------------------------------

" Nerdtree file browser
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
" Nerdtree git extend
Plug 'Xuyuanp/nerdtree-git-plugin'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Buffers tabline
Plug 'ap/vim-buftabline'
" Matchit enhances jump motions
Plug 'tmhedberg/matchit'
" Improves % matching
"Plug 'vim-scripts/matchit.zip'
" Use V or v, easily expand region selected
Plug 'terryma/vim-expand-region'
" Vim-Multiple-Cursors
Plug 'terryma/vim-multiple-cursors'
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
Plug 'dyng/ctrlsf.vim', { 'on': ['CtrlSF', 'CtrlSFToggle'] }
" rely CtrlSF
Plug 'mileszs/ack.vim'
" Git swiss-army knife
Plug 'tpope/vim-fugitive'
" Git changes showed on line numbers
Plug 'airblade/vim-gitgutter'
" This is a simple plugin that helps to end certain structures automatically
Plug 'tpope/vim-endwise'
" Class/module browser, ctag support, suppoer powerline
Plug 'majutsushi/tagbar'
" Auto filejump, <C-p> support tagbar  http://www.wklken.me/posts/2015/06/07/vim-plugin-tagbar.html
Plug 'kien/ctrlp.vim'
" Quick annotation
Plug 'scrooloose/nerdcommenter'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Text insertion/manipulation {{{
" ---------------------------------------------------------------------------------------------------------------------

" Surround (cs"')
Plug 'tpope/vim-surround'
" Easy alignment, Use :Tab\"
Plug 'godlygeek/tabular', { 'on':  'Tabularize' }
" Show content of registers when pasting
"Plug 'junegunn/vim-peekaboo'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Extra text objects {{{
" ---------------------------------------------------------------------------------------------------------------------

" Comment text object (vac)
"Plug 'glts/vim-textobj-comment'
" Improved targets line cin) next parens
Plug 'wellle/targets.vim'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Colorschemes {{{
" ---------------------------------------------------------------------------------------------------------------------

Plug 'icymind/NeoSolarized'
" Molokai
"Plug 'tomasr/molokai'
" Iceberg
"Plug 'cocopon/iceberg.vim'
" Tender
"Plug 'jacoborus/tender.vim'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Other {{{
" ---------------------------------------------------------------------------------------------------------------------

" More . repeat functionality
Plug 'tpope/vim-repeat'
" Delete all but current buffer
Plug 'vim-scripts/BufOnly.vim', { 'on': 'Bonly' }
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
"set textwidth=120                           " Text width is 120 characters
set cmdheight=1                             " Command line height
set pumheight=10                            " Completion window max size
set hidden                                  " Enables to switch between unsaved buffers and keep undo history
set clipboard+=unnamed                      " Allow to use system clipboard
set lazyredraw                              " Don't redraw while executing macros (better performance)
set showmatch                               " Show matching brackets when text indicator is over them
set matchtime=2                             " How many tenths of a second to blink when matching brackets
set nostartofline                           " Prevent cursor from moving to beginning of line when switching buffers
set virtualedit=block                       " To be able to select past EOL in visual block mode
set nojoinspaces                            " No extra space when joining a line which ends with . ? !
set scrolloff=5                             " Scroll when closing to top or bottom of the screen
set updatetime=1000                         " Update time used to create swap file or other things
set suffixesadd+=.js,.rb                    " Add js and ruby files to suffixes
set synmaxcol=220                           " Don't try to syntax highlight minified files
set expandtab                               " Tab转换为空格
set smarttab
"set smartindent                             " 更加智能的缩进，当遇到缩进不为整数与上对齐
set autoindent
set cindent
set mouse-=a                                " 鼠标暂不启用，a 是所有模式下
set nowrap                                  " 不自动折行
set viminfo+=!                              " 保存全局变量
set softtabstop=4                           " 让 vim 把连续数量的空格视为一个制表符
set shiftwidth=4                            " 设置格式化时制表符占用空格数
set tabpagemax=15                           " Only show 15 tabs
set tabstop=4                               " 每四行一个缩进
set shiftround

set number                                  " Line numbers on
set numberwidth=4
set relativenumber
set cursorline cursorcolumn
augroup relative_numbser                    " 插入模式下用绝对行号, 普通模式下用相对
  autocmd!
  autocmd InsertEnter * :set norelativenumber number
  autocmd InsertLeave * :set relativenumber
augroup END
augroup relative_numbser                    " 高亮当前行
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
"set nohlsearch                              " Don't highlight after search
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
set completeopt-=preview                    " Don't show preview scratch buffers
set nocompatible                            " 禁用Vi的兼容模式,去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set laststatus=2
set wildmenu                                " Tab自动补全时，单行菜单形式显示
set wildmode=list:longest,list:full
set wildignore=*.o,*.obj,*~
set wildignore+=*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=tmp/**,*/tmp/*
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.10 Neovim specific settings {{{
" ---------------------------------------------------------------------------------------------------------------------
if has('nvim')
  let g:loaded_python_provider=1                        " Disable python 2 interface
  let g:python_host_skip_check=1                        " Skip python 2 host check
  let g:python3_host_prog='/data/vimvenv/bin/python3'                      " Set python 3 host program
  set inccommand=nosplit                                " Live preview of substitutes and other similar commands
endif
"}}}

" -----------------------------------------------------
" 2.11 Ctags settings {{{
" -----------------------------------------------------
" For Ruby STD ctags use tpope/rbenv-ctags + vim-ruby
" For gem ctags use tpope/gem-ctags + vim-bundler
" For project tags generation use gem install starscope
" -----------------------------------------------------
"}}}

" -----------------------------------------------------
" 2.12 True colors settings {{{
" -----------------------------------------------------
if has('termguicolors')
  set termguicolors " Turn on true colors support
endif
"}}}

" -----------------------------------------------------
" 2.13 Language settings {{{
" -----------------------------------------------------
let $LANG="zh_CN"
"}}}

" -----------------------------------------------------
" 2.14 File settings {{{
" -----------------------------------------------------
set fileformat=unix
set nobackup                                " no file backup
set noswapfile                              " New buffers will be loaded without creating a swapfile
set confirm                                 " Need confrimation while exit
set autowrite                               " Automatically :write before running commands
set autoread                                " Set to auto read when a file is changed from the outside
set autowriteall
ca w!! w !sudo tee "%"                      " save as sudo
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
" 3.2 Disabling arrow keys, space key, exmode enter {{{
" with Q key, help with F1, etc.
" -----------------------------------------------------
inoremap <F1> <NOP>
nnoremap <F1> <NOP>
"nnoremap <up> <NOP>
"nnoremap <down> <NOP>
"nnoremap <left> <NOP>
"nnoremap <right> <NOP>
"vnoremap <up> <NOP>
"vnoremap <down> <NOP>
"vnoremap <left> <NOP>
"vnoremap <right> <NOP>
"nnoremap <bs> <NOP>
"nnoremap <delete> <NOP>
"nnoremap <Space> <NOP>
"nnoremap Q <NOP>
"}}}

" -----------------------------------------------------
" 3.3 Vim defaults overriding {{{
" -----------------------------------------------------

" Easier window switching
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
vnoremap y y`]
vnoremap p "_dP`]
nnoremap p p`]

" Fix the cw at the end of line bug default vim has special treatment (:help cw)
nmap cw ce
nmap dw de
nmap yw ye

" Uppercase word in insert mode
inoremap <C-u> <ESC>mzgUiw`za

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

" Yank and paste from clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>yy "+yy
nnoremap <leader>p "+p

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" CTags generation / navigation (:tselect to select from menu)
nnoremap ]t :tn<CR>
nnoremap [t :tp<CR>
nnoremap <leader>ts :ts<CR>
nnoremap <leader>tg :GTags<CR>

" QuickFix navigation
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>

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

" Start search on current word under the cursor
"nnoremap <leader>/ /<CR>

" Start reverse search on current word under the cursor
"nnoremap <leader>? ?<CR>

" Faster sort
"vnoremap <leader>s :!sort<CR>

" Fix spelling error on the go
inoremap <C-l> <C-g>u<ESC>[s1z=`]a<C-g>u

" Toggle search highlight
" nnoremap <leader>/ :set nohlsearch!<CR> :set nohlsearch?<CR>  " 取消高亮，再搜索会有bug
nnoremap <leader>/ :let @/=""<CR>

" allow saving file as sudo when forgot to start vim using sudo
cmap w!! w !sudo tee > /dev/null %
"}}}

" -----------------------------------------------------
" 3.5 F-key actions {{{
" -----------------------------------------------------
" Free
" nnoremap <silent> <F1>
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
nnoremap <silent> <C-Right> :call utils#intelligentVerticalResize('right')<CR>
nnoremap <silent> <C-Left> :call utils#intelligentVerticalResize('left')<CR>
nnoremap <silent> <C-Up> :resize +1<CR>
nnoremap <silent> <C-Down> :resize -1<CR>

" Buffers navigation and management
nnoremap <silent> + :bn<CR>
nnoremap <silent> _ :bp<CR>
"}}}

" Switch alternate file, http://vim.wikia.com/wiki/Go_to_alternate_file_or_next_file_if_no_alternate
nnoremap <silent> <leader>, <C-^>

" -----------------------------------------------------
" 3.7 Command abbreviations and mappings {{{
" -----------------------------------------------------

" Quiting and saving all
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

command! PyBreakPoint :call utils#PyBreakPointOperate(line('.'))
nnoremap <silent> <buffer> <leader>b :PyBreakPoint<CR>
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
"let g:UltiSnipsUsePythonVersion=3
"}}}

" -----------------------------------------------------
" 4.3 Gitgutter settings {{{
" -----------------------------------------------------
if exists('&signcolumn')
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif
let g:gitgutter_async=1
let g:gitgutter_map_keys=0
let g:gitgutter_max_signs=9999
let g:gitgutter_sign_added='+'
let g:gitgutter_sign_modified='~'
let g:gitgutter_sign_removed='-'
let g:gitgutter_sign_modified_removed='~'
let g:gitgutter_sign_removed_first_line='-'
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
" 4.4 CtrlP settings {{{
" -----------------------------------------------------
let g:ctrlp_custom_ignore='\v[\/]\.(git|hg|svn|exe|so|dll|pyc)$'
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
let g:deoplete#enable_refresh_always=0
let g:deoplete#enable_smart_case=1
let g:deoplete#file#enable_buffer_path=1

let g:deoplete#sources#jedi#server_timeout=10
let g:deoplete#sources#jedi#enable_cache=1

let g:deoplete#sources={}
let g:deoplete#sources._    = ['around', 'buffer', 'file', 'ultisnips']
let g:deoplete#sources.ruby = ['around', 'buffer', 'member', 'file', 'ultisnips']
let g:deoplete#sources.vim  = ['around', 'buffer', 'member', 'file', 'ultisnips']
let g:deoplete#sources.python  = ['jedi', 'around', 'buffer', 'member', 'file', 'ultisnips']
let g:deoplete#sources.css  = ['around', 'buffer', 'member', 'file', 'omni', 'ultisnips']
let g:deoplete#sources.scss = ['around', 'buffer', 'member', 'file', 'omni', 'ultisnips']
let g:deoplete#sources.html = ['around', 'buffer', 'member', 'file', 'omni', 'ultisnips']
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
" 4.10 Deoplete-tern settings {{{
" -----------------------------------------------------
let g:tern_request_timeout=1
let g:tern_show_signature_in_pum=1
"}}}

" -----------------------------------------------------
" 4.11 ale {{{
" -----------------------------------------------------
let g:ale_linters = {
\   'vim' : ['vint'],
\   'python' : ['flake8', 'isort'],
\   'markdown' : ['mdl'],
\   'sh' : ['shellcheck'],
\   'javascript' : ['eslint'],
\}
let g:ale_sign_column_always=1
"let g:ale_fix_on_save=1
let g:ale_lint_on_save=1
let g:ale_lint_on_text_changed='always'
let g:ale_sign_error='•'
let g:ale_sign_warning='•'
set statusline=%{utils#LinterStatus()}

"}}}

" -----------------------------------------------------
" 4.12 Yapf {{{
" -----------------------------------------------------
let g:yapf_style_conf="~/.config/yapf/style"
"}}}

" -----------------------------------------------------
" 4.13 Nerdcommenter {{{
" -----------------------------------------------------
" <leader>cc   加注释
" <leader>cu   解开注释
" <leader>c<space>  加上/解开注释, 智能判断
" 注释的时候自动加个空格, 强迫症必配
" let g:NERDSpaceDelims=1
"}}}

" -----------------------------------------------------
" 4.13 vim-jedi {{{
" -----------------------------------------------------
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>gn"
let g:jedi#rename_command = "<leader>gr"
let g:jedi#completions_enabled = 1
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
"let g:UltiSnipsExpandTrigger='<C-j>'
"let g:UltiSnipsListSnippets='<C-s>'
"let g:UltiSnipsJumpForwardTrigger='<C-j>'
"let g:UltiSnipsJumpBackwardTrigger='<C-k>'
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
"}}}

" -----------------------------------------------------
" 5.6 Ctrl-SF {{{
" -----------------------------------------------------
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

nnoremap <silent> <leader>g :call utils#searchCurrentWordWithAg()<CR>
"}}}

" -----------------------------------------------------
" 5.7 BufOnly -> [C]lose all {{{
" -----------------------------------------------------
nnoremap <leader>C :Bonly<CR>
"}}}

" -----------------------------------------------------
" 5.8 Tabularize -> [a]lign {{
" -----------------------------------------------------
vnoremap <leader>a :Tabularize /
"}}}

" -----------------------------------------------------
" 5.9 vim-multiple-cursors {{
" -----------------------------------------------------
let g:multi_cursor_use_default_mapping=1

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
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
  autocmd BufNewFile,BufRead *.txt setlocal spell
augroup END
"}}}

" Remove trailing whitespaces automatically before save {{{
augroup strip_ws
  autocmd BufWritePre * call utils#stripTrailingWhitespaces()
augroup END
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
