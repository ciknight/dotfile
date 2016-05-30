" Use Vim settings, rather then Vi settings.
"""""""""""""
" 平台判断
"""""""""""""
function! MySys()
    if has("win32")
        return "windows"
    else
        return "linux"
    endif
endfunction

" Leader
let mapleader = ","
"""""""""""""
"Gerneral
"""""""""""""
" Enable filetype plugin
filetype plugin on
filetype indent on
" Syntax
syntax enable
syntax on
" Set to auto read when a file is changed from the outside
set autoread
" 编辑vimrc之后，重新加载
autocmd! bufwritepost .vimrc source ~/.vimrc
" 禁用Vi的兼容模式
set nocompatible
" 设定状态栏多显示信息
" set ncb!
set noscrollbind
set nocursorbind
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" Get off my lawn
" nnoremap <Left> :echoe 'Use h'<CR>
" nnoremap <Right> :echoe 'Use l'<CR>
" nnoremap <Up> :echoe 'Use k'<CR>
" nnoremap <Down> :echoe 'Use j'<CR>
" split navigations
" quick switch slpite panel
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" space & tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=2   " Backspace deletes like most programs in insert mode"
set shiftround
set expandtab
set autoindent
" file backup
set nobackup
set nowritebackup
set noswapfile
set autowrite     " Automatically :write before running commands"
set history=50
set confirm       " Need confrimation while exit"
set fileformat=unix
set nowrap
" ui config
set number
set numberwidth=5
"set ruler         " show the cursor position all the time"
set showcmd       " display incomplete commands"
" Highlight current line
au WinEnter * set cursorline cursorcolumn
au WinLeave * set nocursorline nocursorcolumn
set wildmenu
set showmatch
" Searching
set incsearch     " do incremental searching
set hlsearch
set ignorecase smartcase
let g:EasyGrepRecursive=1  " 可以使默认模式改为递归
let g:EasyGrepMode=2  " grep指定文件
" Folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
" Enable folding with the spacebar
nnoremap <space> za
" 显示折叠代码的文档字符串
let g:SimpylFold_docstring_preview=1
" encoding
set fileencodings=ucs-bom,utf-8,cp936,gbk,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8
set encoding=utf-8
""""""""""""""""""""""""
" Load Format config
""""""""""""""""""""""""
" Python Stuffs
if filereadable(expand("~/.vim/ftplugin/python.vimrc"))
    source ~/.vim/ftplugin/python.vimrc
endif
" Html Stuffs
if filereadable(expand("~/.vim/ftplugin/frontend.vimrc"))
    source ~/.vim/ftplugin/frontend.vimrc
endif
"""""""""""""""""""""""""""""""""""
" About Bundle
"
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
"""""""""""""""""""""""""""""""""""
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
   syntax on
endif
" import budles
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

augroup vimrcEx
  autocmd!
  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END
" Display extra whitespace
set list listchars=tab:»·,trail:·
" Make it obvious where 80 characters is
" set textwidth=80
" set colorcolumn=+1  " idon't like
" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
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
" Switch between the last two files
nnoremap <leader><leader> <c-^>
" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
set matchpairs+=<:>
" Nerd Tree
let NERDChristmasTree=0
let NERDTreeWinSize=40
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
autocmd vimenter * if !argc() | NERDTree | endif " Automatically open a NERDTree if no files where specified
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " Close vim if the only window left open is a NERDTree
nmap <F5> :NERDTreeToggle<cr>
" Theme
if has('gui_running')
  set background=light
  colorscheme solarized
else
  set background=dark
  colorscheme molokai
endif
" Switch theme
" call togglebg#map("<F5>")
" Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F6> :TagbarToggle<CR>
" Emmet
let g:user_emmet_mode='i' " enable for insert mode
" nohlsearch shortcut
nmap -hl :nohlsearch<cr>
nmap +hl :set hlsearch<cr>
" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
let python_highlight_all=1
" ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" file operate
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
" vim-rspec mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>
" Vim-instant-markdown doesn't work in zsh
" set shell=bash\ -i
" close python mode Regenerate repo cache
let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0
" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
