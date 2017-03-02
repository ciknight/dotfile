autocmd BufNewFile,BufRead *.html,*.css,*.js,*.json,*.yaml,*yml
            \ set tabstop=2 |
            \ set softtabstop=2 |
            \ set shiftwidth=2 |
            \ set shiftwidth=2 |
            \ set textwidth=150 |
            \ set colorcolumn=+1 |
            \ set expandtab |
            \ set autoindent |
            \ set fileformat=unix |

" Emmet
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
" only use html,css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" To remap the default <C-Y> leader:>
" let g:user_emmet_leader_key='<C-Y>'
" scss support
