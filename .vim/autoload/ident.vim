" ident 2
autocmd BufNewFile,BufRead *.html,*.css,*.js,*.json,*.yaml,*.yml,*.vim,*.lua
            \ set tabstop=2 |
            \ set softtabstop=2 |
            \ set shiftwidth=2 |
            \ set textwidth=150 |
            \ set colorcolumn=+1 |
            \ set expandtab |
            \ set autoindent |
            \ set fileformat=unix |

" ident 4
autocmd BufNewFile,BufRead *.py
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
            " \ set textwidth=110 |
            \ set colorcolumn=+1 |
            \ set expandtab |
            \ set autoindent |
            \ set fileformat=unix |
