:au BufNewFile,BufRead *.js, *.html, *.css
            \ set tabstop=2 |
            \ set softtabstop=2 |
            \ set shiftwidth=2 |
            \ set shiftwidth=2 |
            \ set textwidth=90 |
            \ set colorcolumn=+1 |

" JQuery syntax support
:au Syntax javascript set syntax=jquery 
" Emmet
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" To remap the default <C-Y> leader:>
" let g:user_emmet_leader_key='<C-Z>'
