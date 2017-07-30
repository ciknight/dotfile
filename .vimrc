"==========================================
" .vimrc of ci_knight
"
" blog site https://blog.ibeats.top
"
"==========================================


"==========================================
" Initial Vim Plugin
"==========================================
if filereadable(expand("~/.vim/autoload/init.vim"))
    source ~/.vim/autoload/init.vim
endif

" 编辑vimrc之后，重新加载 :source %
" autocmd BufWritePost $MYVIMRC source $MYVIMRC


"==========================================
" Plugin Setting
"==========================================
if filereadable(expand("~/.vim/autoload/plugin_config.vim"))
    source ~/.vim/autoload/plugin_config.vim
endif


"==========================================
" General Settings
"==========================================
if filereadable(expand("~/.vim/autoload/config.vim"))
    source ~/.vim/autoload/config.vim
endif


"==========================================
" Key Map
"==========================================
if filereadable(expand("~/.vim/autoload/keymap.vim"))
    source ~/.vim/autoload/keymap.vim
endif


"==========================================
" Custom Plugin
"==========================================
if filereadable(expand("~/.vim/autoload/custom.vim"))
    source ~/.vim/autoload/custom.vim
endif


"==========================================
" Code Language Setting
"==========================================
if filereadable(expand("~/.vim/language.vim"))
    source ~/.vim/language.vim
endif
