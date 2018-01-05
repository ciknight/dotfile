"==========================================
" .vimrc of ci_knight
"
" blog site https://blog.ibeats.top
"
"==========================================


"==========================================
" Initial Vim Plugin
"==========================================
if filereadable(expand("~/.vim/config/init.vim"))
    source ~/.vim/config/init.vim
endif

" 编辑vimrc之后，重新加载 :source %
" autocmd BufWritePost $MYVIMRC source $MYVIMRC


"==========================================
" General Settings
"==========================================
if filereadable(expand("~/.vim/config/config.vim"))
    source ~/.vim/config/config.vim
endif


"==========================================
" Key Map
"==========================================
if filereadable(expand("~/.vim/config/keymap.vim"))
    source ~/.vim/config/keymap.vim
endif


"==========================================
" Custom Plugin
"==========================================
if filereadable(expand("~/.vim/config/custom.vim"))
    source ~/.vim/config/custom.vim
endif


"==========================================
" Ident
"==========================================
if filereadable(expand("~/.vim/config/ident.vim"))
    source ~/.vim/config/ident.vim
endif


"==========================================
" Plugin Setting
"==========================================
if filereadable(expand("~/.vim/config/plugin_config.vim"))
    source ~/.vim/config/plugin_config.vim
endif
