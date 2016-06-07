" set python pep8
:au BufNewFile,BufRead *.py
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
            \ set textwidth=90 |
            \ set colorcolumn=+1 |
            \ set expandtab |
            \ set autoindent |
            \ set fileformat=unix |

" no whitespace
" define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred
" 标示不必要的空白字符
:au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

