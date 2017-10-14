" map、nmap、vmap和imap命令分别指定映射仅在normal、visual、insert
" noremap、nnoremap、vnoremap、inoremap、 非递归映射，只解析一次

" leader mapping
let mapleader = ","
set timeoutlen=350  " wait leader

"""""""""" Normal """"""""""""""
" tab navigation
nnoremap tn :tabn<CR>
nnoremap tp :tabp<CR>
nnoremap tm :tabm<CR>
nnoremap tt :tabnew<CR>

" Quickfix
nnoremap ]q :cnext<CR>zz
nnoremap [q :cprev<CR>zz
nnoremap ]l :lnext<CR>zz
nnoremap [l :lprev<CR>zz

" Buffers
nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>

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

vnoremap h <Left>
vnoremap j <Up>
vnoremap k <Down>
vnoremap l <Right>

" navigate window movement with C+arrows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" qq to record, Q to replay (recursive map due to peekaboo)
nnoremap Q @q

" 定义快捷键到行首和行尾
" nnoremap lt ^
" nnoremap le $

" folding
nnoremap <space> za

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" F1 废弃这个键,防止调出系统帮助
" I can type :help on my own, thanks.  Protect your fat fingers from the evils of <F1>
noremap <F1> <Esc>"

" F2 行号开关，用于鼠标复制代码用
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

" F5 粘贴模式paste_mode开关,用于有格式的代码粘贴
" F5 set paste问题已解决, 粘贴代码前不需要按F5了
set pastetoggle=<F5>
" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste

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
nnoremap <Leader>Q :qa!<CR>

"""""""""" Insert """"""""""""""
inoremap <leader>w :w<CR>
inoremap <leader>q :q<CR>
inoremap <c-d> <esc>ddi
inoremap <c-x> <esc>yypi
inoremap <c-u> <esc>ui
inoremap <c-c> <esc>
inoremap <esc> <Nop>

"""""""""" Onoremap """"""""""""""
onoremap p i(
onoremap b /return<cr>
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
