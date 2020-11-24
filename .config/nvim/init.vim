" ######################################################################################################################
" ### Author : CI_Knight ci_knight@msn.cn>                                                                           ###
" ######################################################################################################################
" ### Neovim Configuration focused on Python development                                                             ###
" ### Neovimmer since : Jan 2018                                                                                     ###
" ### Vimmer since    : Nov 2015                                                                                     ###
" ######################################################################################################################

" ======================================================================================================================
" 1.0 Plugin manager (Plug) settings {{{
" ======================================================================================================================
" Autoinstall {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup plug_install
    autocmd VimEnter * PlugInstall
  augroup END
endif
" }}}

" ---------------------------------------------------------------------------------------------------------------------
" 1.1 Plugin list {{{
" ---------------------------------------------------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')
filetype plugin indent off
syntax off

" ---------------------------------------------------------------------------------------------------------------------
" Language agnostic plugins {{{
" ---------------------------------------------------------------------------------------------------------------------
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'w0rp/ale'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Other languages {{{
" ---------------------------------------------------------------------------------------------------------------------
" Python auto breakpoint
"Plug 'ciknight/setbreakpoint'
Plug 'vim-scripts/indentpython.vim'  " Fix Python vim error indentions, eg. use type hint
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Interface improving {{{
" ---------------------------------------------------------------------------------------------------------------------
"Plug 'ryanoasis/vim-devicons'  " Icon
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Matchit enhances jump motions, Improved % matching
Plug 'tmhedberg/matchit'
" Use V or v, easily expand region selected
Plug 'terryma/vim-expand-region'
" fix C-v copy yank
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
" Git swiss-army knife
Plug 'tpope/vim-fugitive'
" Git changes showed on line numbers, TODO: replace by coc-git
Plug 'airblade/vim-gitgutter'
" Class/module browser, ctag support, suppoer powerline
Plug 'majutsushi/tagbar'
" filejump
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
" Quick annotation
Plug 'scrooloose/nerdcommenter'
" Motions on speed
Plug 'easymotion/vim-easymotion'
"Plug 'myusuf3/numbers.vim'
Plug 'junegunn/goyo.vim'
Plug 'voldikss/vim-floaterm'
Plug 'honza/vim-snippets'
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
Plug 'morhetz/gruvbox'
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" Other {{{
" ---------------------------------------------------------------------------------------------------------------------
" More . repeat functionality
Plug 'tpope/vim-repeat'
" Did you mean file open
Plug 'EinfachToll/DidYouMean'
" Vim start time debug tool or 'dstein64/vim-startuptime'
Plug 'tweekmonster/startuptime.vim'
"}}}

call plug#end()
"}}}

" ======================================================================================================================
" 2.0 Basic settings (Neovim defaults: https://neovim.io/doc/user/vim_diff.html#nvim-option-defaults) {{{
" ======================================================================================================================
set encoding=utf-8                          " The encoding displayed.
set fileencoding=utf-8                      " The encoding written to file.
set termencoding=utf-8
scriptencoding utf-8                        " Set utf-8 as default script encoding

set shell=/bin/zsh                          " Setting shell to zsh
set showmode                                " Always show mode
set showcmd                                 " Show commands as you type them
"set textwidth=100                          " Text width is 100 characters, Auto wrap
set cc=100                                  " hit 100 characters, alias cc=colorcolumn
"set wrapmargin=0
set nowrap                                  " 不自动折行
set linebreak
set cmdheight=1                             " Command line height, Better display for messages
set pumheight=10                            " Completion window max size, popup_menu
set pumblend=0                              " https://github.com/neovim/neovim/pull/9571, 不透明popup, 影响可读性
set winblend=0
set hidden                                  " Enables to switch between unsaved buffers and keep undo history
set clipboard^=unnamed,unnamedplus          " Allow to use system clipboard
set lazyredraw                              " Don't redraw while executing macros (better performance)
set showmatch                               " Show matching brackets when text indicator is over them
set matchtime=2                             " How many tenths of a second to blink when matching brackets
set nostartofline                           " Prevent cursor from moving to beginning of line when switching buffers
set virtualedit=block                       " To be able to select past EOL in visual block mode
set nojoinspaces                            " No extra space when joining a line which ends with . ? !
set scrolloff=5                             " Scroll when closing to top or bottom of the screen
set updatetime=300                          " Update time used to create swap file or other things, You will have bad experience for diagnostic messages when it's default 4000.
set suffixesadd+=.js,.rb                    " Add js and ruby files to suffixes
set synmaxcol=200                           " Don't try to syntax highlight minified files, highlight max column
set expandtab                               " Tab转换为空格
set smarttab
set autoindent
set smartindent                             " 更加智能的缩进，当遇到缩进不为整数与上对齐
set mouse-=a                                " 鼠标禁用，a 是所有模式下, -a 是禁用鼠标模式
set viminfo+=!                              " 保存全局变量
set softtabstop=4                           " 让 vim 把连续数量的空格视为一个制表符
set shiftwidth=4                            " 设置格式化时制表符占用空格数
set tabpagemax=15                           " Only show 15 tabs
set tabstop=4                               " 每四行一个缩进
set shiftround
set shortmess+=c                            " don't give |ins-completion-menu| messages.
set signcolumn=yes                          " always show signcolumns
set whichwrap+=<,>,h,l                      " 箭头键可以跳到下一行
set backspace=2
set backspace=eol,start,indent
set title
set laststatus=2
set showtabline=2
set display=lastline
set diffopt+=internal,algorithm:patience
set number                                  " Line numbers on
set numberwidth=1
set ruler
set relativenumber
set cursorline cursorcolumn
augroup relative_numbser                    " 插入模式下用绝对行号, 普通模式下用相对
  autocmd!
  autocmd InsertEnter * :set norelativenumber number
  autocmd InsertLeave * :set relativenumber
augroup END
augroup auto_highlight_cursor                     " 高亮光标行
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
  set undodir=~/.local/share/nvim/tmp/undo//
endif
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.6 White characters settings {{{
" ---------------------------------------------------------------------------------------------------------------------
set list                                        " Show listchars by default
set listchars=tab:»·,trail:·                    ",eol:↵,nbsp:␣  " Display extra whitespace
set iskeyword+=_,$,@,%,#,-                      " 带有如下符号的单词不要被换行分割
"set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·,nbsp:·
"set showbreak=↪
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.7 Filetype settings {{{
" ---------------------------------------------------------------------------------------------------------------------
filetype plugin on
filetype indent on
syntax on
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
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.9.1 Command Window settings {{{
" ---------------------------------------------------------------------------------------------------------------------
set wildmenu                                " Tab自动补全时，单行菜单形式显示
set wildignorecase
set wildmode=longest,full                   " longest,list
set wildignore=*.o,*.obj,*~                 " MacOSX/Linux, not support Windows
set wildignore+=*.so,*.swp,*.zip,*.png,*.jpg,*.gif
set wildignore+=*vim/backups*
set wildignore+=*.pyc,__pycache__,
set wildignore+=*DS_Store*
set wildignore+=tmp/**,*/tmp/*
set cpoptions+=I
" neovim only
if matchstr(execute('silent version'), 'NVIM v\zs[^\n-]*') >= '0.4.0'
  set shada='20,<50,s10
  set inccommand=nosplit
  set wildoptions+=pum
  set signcolumn=yes:2
  set pumblend=10
endif

"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.10 Neovim specific settings {{{
" ---------------------------------------------------------------------------------------------------------------------
if has('nvim')
  let g:loaded_node_provider = 0
  let g:loaded_ruby_provider = 0
  let g:loaded_perl_provider = 0
  let g:loaded_python_provider=0                                   " Disable python 2 interface
  let g:python_host_skip_check=1                                   " Skip python 2 host check

  set pyxversion=3
  let g:python3_host_prog=$HOME.'/workspace/neovim3/bin/python'    " Set python 3 host program, using virtualenv
  let g:python3_host_skip_check=1                                  " Skip python 3 host check neovim module
  set inccommand=nosplit                                           " Live preview of substitutes and other similar commands
  set pyxversion=3
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
"set formatoptions=tcqmM                    " format ggvg=
set fileformat=unix
set formatexpr=CocAction('formatSelected')
set nobackup                                " no file backup
set noswapfile                              " New buffers will be loaded without creating a swapfile
set confirm                                 " Need confrimation while exit
set autowrite                               " Automatically :write before running commands
set autoread                                " Set to auto read when a file is changed from the outside
set nowritebackup
set autowriteall
cmap w!! w !sudo tee % > /dev/null          " Allow saving file as sudo when forgot to start vim using sudo
"}}}

" ---------------------------------------------------------------------------------------------------------------------
" 2.14 Ident settings {{{
" ---------------------------------------------------------------------------------------------------------------------
" indentLine will overwrite your "concealcursor" and "conceallevel" with default value
let g:indentLine_concealcursor='inc'
let g:indentLine_conceallevel=0
autocmd FileType python setlocal shiftwidth=4 tabstop=4 fo-=t nowrap
autocmd FileType go setlocal shiftwidth=4 tabstop=4
autocmd FileType javascript,sql,json,html,css,xml,yaml,yml,vim,shell,markdown setlocal shiftwidth=2 tabstop=2
autocmd FileType markdown setlocal fo-=t wrap " alias fo=formatoptions, https://vim.fandom.com/wiki/Automatic_word_wrapping
"}}}

"}}}

" ======================================================================================================================
" 3.0 Mapping settings {{{
" ======================================================================================================================

" -----------------------------------------------------
" 3.1 Setting leader {{{
" -----------------------------------------------------
"let g:mapleader="\<space>"
let mapleader = ","
set timeoutlen=400  " wait leader
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

" Remap H and L (top, bottom of screen to left and right end of line, breaks the head and low jump)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

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
"nmap cw ce
"nmap dw de
"nmap yw ye

" Uppercase word in insert mode
inoremap <C-u> <ESC>mzgUiw`za

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <C-c> <C-[>
inoremap <Esc> <C-[>
nnoremap <C-c> <C-[>
nnoremap <Esc> <C-[>

" Matching brackets with TAB (using matchit) (Breaks the <C-i> jump, can use C- o)
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
nnoremap <silent> <F2> :CocCommand explorer<CR>
" TabBar
nnoremap <silent> <F3> :call utils#TabBar()<CR>
" Toggle spelling
nnoremap <silent> <F4> :set spell!<CR> :set spell?<CR>
" Free
" nnoremap <silent> <F5>
" Free
" nnoremap <silent> <F6>
" Toggle white characters visibility
nnoremap <silent> <F7> :set list!<CR> :set list?<CR>
" Free
" nnoremap <silent> <F8>
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
"cnoremap ww wqall
"cnoremap qq qall
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
" 4.0 Plugins settings {{{
" ======================================================================================================================

" -----------------------------------------------------
" 4.1 {{{
" -----------------------------------------------------
"}}}

" -----------------------------------------------------
" 4.2 ale settings {{{
" -----------------------------------------------------
"
let g:ale_enabled=0
let g:ale_fix_on_save=1
let g:ale_fixers = {
\   '*': [
\     'trim_whitespace',
\     'remove_trailing_lines',
\   ],
\  'python': ["black", "isort"]
\}
let g:ale_python_isort_options = '--settings-path ${HOME}/.isort.cfg'

"" if you don't want linters to run on opening a file
let g:ale_linters={}
let g:ale_lint_on_enter=0
let g:ale_lint_on_text_changed='never'  " never,always
let g:ale_lint_on_insert_leave=0
let g:ale_lint_on_filetype_changed=0
let g:ale_lint_on_save=0
"}}}

" -----------------------------------------------------
" 4.3 Gitgutter settings {{{
" -----------------------------------------------------
if exists('&signcolumn')
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always=1
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
let g:airline#extensions#coc#enabled=1
"}}}

" -----------------------------------------------------
" 4.4 FZF {{{
" -----------------------------------------------------
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.

let g:fzf_preview_floating_window_rate = 0.8

" Enable per-command history.
let g:fzf_history_dir = '~/.local/share/fzf-history'

"}}}

" -----------------------------------------------------
" 4.5 Rainbow settings {{{
" -----------------------------------------------------
let g:rbpt_colorpairs=[
            \ ['brown',       'RoyalBlue3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
            " 不加入这行, 防止黑色括号出现, 很难识别
            " \ ['black',       'SeaGreen3'],
            " \ ['Darkblue',    'SeaGreen3'],
            " \ ['Darkblue',    'firebrick3'],
let g:rbpt_max=16
let g:rbpt_loadcmd_toggle=0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"}}}

" -----------------------------------------------------
" 4.6 coc settings {{{
" -----------------------------------------------------
let g:coc_global_extensions = [
\  'coc-json',
\  'coc-pairs',
\  'coc-python',
\  'coc-rls',
\  'coc-vimlsp',
\  'coc-snippets',
\  'coc-highlight',
\  'coc-marketplace',
\  'coc-yaml',
\  'coc-sql',
\  'coc-emoji',
\  'coc-go',
\  'coc-ci',
\  'coc-lists',
\  'coc-spell-checker',
\  'coc-floaterm',
\  'coc-actions',
\  'coc-markdownlint',
\  'coc-discord',
\  'coc-calc',
\  'coc-explorer',
\  'coc-fzf-preview',
\  'coc-yank',
\  'coc-template',
\  'coc-pyright',
\]
let g:coc_snippet_next='<tab>'

" debug coc
"let g:coc_node_args = ['--nolazy', '--inspect-brk=9222']
"let $NVIM_COC_LOG_LEVEL='debug'
"let g:node_client_debug=1
"Use command :call coc#client#open_log() to open log file, or use :echo $NODE_CLIENT_LOG_FILE to get file path of log.

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
" 4.10 settings {{{
" -----------------------------------------------------
"}}}

" -----------------------------------------------------
" 4.11 Floaterm settings {{{
" -----------------------------------------------------
let g:floaterm_keymap_new = 'T'
let g:floaterm_position = 'center'
"}}}

" -----------------------------------------------------
" 4.12 Nerdcommenter {{{
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

"}}}

" ======================================================================================================================
" 5.0 Plugin mappings {{{
" ======================================================================================================================

" -----------------------------------------------------
" 5.1 {{{
" -----------------------------------------------------
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
" 5.4 {{{
" -----------------------------------------------------
"}}}

" -----------------------------------------------------
" 5.5 Coc {{{
" -----------------------------------------------------
" Use `M-j` and `M-k` to navigate diagnostics
nmap <silent> <M-j> <Plug>(coc-diagnostic-next)
nmap <silent> <M-k> <Plug>(coc-diagnostic-prev)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if coc#util#has_float()
    call coc#util#float_hide()
  elseif (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction

xmap <silent> <leader>ac :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>ac :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@<CR>

" use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" use <tab> for trigger completion and navigate next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" ---- snippet ----
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

"}}}

" -----------------------------------------------------
" 5.6 Tabularize -> [a]lign {{{
" -----------------------------------------------------
vnoremap <leader>a :Tabularize /
"}}}

" -----------------------------------------------------
" 5.7 FZF {{{
" -----------------------------------------------------
nnoremap <Leader>p :CocCommand fzf-preview.ProjectFiles<CR>
"}}}

" -----------------------------------------------------
" 5.8 easymotion {{{
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
" 5.9 vim-miniyank {{{
" -----------------------------------------------------
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
"}}}

" -----------------------------------------------------
" 5.10 vim-surround {{{
" -----------------------------------------------------
" ysiwb
" yssb
" dsb
" csb
"}}}

"}}}

" ======================================================================================================================
" 6.0 Color and highlighting settings {{{
" ======================================================================================================================
" Color scheme
"colorscheme NeoSolarized
colorscheme gruvbox
set background=dark

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Fix jsonc comment highlight
autocmd FileType json syntax match Comment +\/\/.\+$+

" Link highlight groups to improve buftabline colors
hi! link BufTabLineCurrent Identifier
hi! link BufTabLineActive Comment
hi! link BufTabLineHidden Comment
hi! link BufTabLineFill Comment

" opaque pmeue
hi PmenuSel blend=0

" Highlight term cursor differently
"highlight TermCursor ctermfg=green guifg=green

" Set floaterm window's background to black
"hi FloatermNF guibg=#002b36
" Set floating window border line color to cyan, and background to orange
"hi FloatermBorderNF guibg=#002b36 guifg=cyan

" Remove underline in folded lines
"highlight! Folded term=NONE cterm=NONE gui=NONE ctermbg=NONE

" Use transparent background color
"highlight Quote ctermbg=109 guifg=#83a598
" Background transparent
"highlight Normal guibg=none
"highlight NonText guibg=none

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
  autocmd BufNewFile *.py,*.sh,*.go CocCommand template.templateTop
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

"}}}
