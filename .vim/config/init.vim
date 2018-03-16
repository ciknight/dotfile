" Setting up vim-plug - the vim plugin manager
" http://vimawesome.com/


" Autoinstall {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup plug_install
    autocmd VimEnter * PlugInstall
  augroup END
endif
" }}}


call plug#begin('~/.vim/plugged')

" -- plugin manager
Plug 'junegunn/vim-plug'


" -- display plugins
Plug 'mhinz/vim-startify' " the fancy start screen or vim
Plug 'terryma/vim-multiple-cursors' " multipie cursor
Plug 'kien/rainbow_parentheses.vim' " rainbow pair
Plug 'Yggdroot/indentLine' " Indent line
" Plug 'kshenoy/vim-signature'  " vim mark


" -- windows plugins
Plug 'scrooloose/nerdtree' " nerdtree nerdtreetabs
Plug 'Xuyuanp/nerdtree-git-plugin' " nerdtree extend
Plug 'vim-airline/vim-airline' " airline
Plug 'vim-airline/vim-airline-themes' " airline themes
Plug 'tpope/vim-fugitive' " diff status
Plug 'airblade/vim-gitgutter' " airline git status
Plug 'tpope/vim-endwise' " https://github.com/tpope/vim-endwise
Plug 'tmhedberg/SimpylFold' " Fold


" -- function plugins
Plug 'pbrisbin/vim-mkdir' " auto create not exists dir
Plug 'scrooloose/nerdcommenter' " quick annotation
Plug 'vim-scripts/DrawIt' " :DIstart or \di, Draw ascii paint  http://www.opstool.com/article/178
Plug 'terryma/vim-expand-region' " use V or v, region selected
Plug 'tpope/vim-repeat' " for repeat -> enhance surround.vim, use . to repeat command
Plug 'Raimondi/delimitMate' " auto sign complate
Plug 'tpope/vim-surround' " surroundings in pairs, cs => change surring cst => tag, ds => delete, csw => add
Plug 'godlygeek/tabular' " Vim script for text filtering and alignment, # :Tab\"


" -- search plugins
Plug 'dyng/ctrlsf.vim' " global seach, use :CtrlSF [pattern]
Plug 'mileszs/ack.vim' " CtrlSF dependency
Plug 'vim-scripts/matchit.zip' " improves % matching
Plug 'majutsushi/tagbar' " Class/module browser, ctag support, suppoer powerline
Plug 'kien/ctrlp.vim' " auto filejump, support tagbar  http://www.wklken.me/posts/2015/06/07/vim-plugin-tagbar.html


" -- autocomplate plugin
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --gocode-completer --clang-completer --system-libclang' }
Plug 'davidhalter/jedi-vim', {'do': 'pip install jedi'} " python use jdei, pip install jedi
Plug 'SirVer/ultisnips'  " http://mednoter.com/UltiSnips.html, Track the engine.
Plug 'honza/vim-snippets'  " Snippets are separated from the engine. Add this if you want them:


" -- syntax plugin
Plug 'w0rp/ale', {'do': 'pip install flake8'} " syntax check
Plug 'ciknight/vim-yapf', {'do': 'pip install yapf'}
Plug 'Shougo/vimshell.vim' " shell
Plug 'pangloss/vim-javascript'
Plug 'fatih/vim-go', {'for': 'go', 'on': 'GoInstallBinaries'} " Golang


" -- Theme plugin
Plug 'tomasr/molokai'  " i like it
Plug 'altercation/vim-colors-solarized'


" -- closing plugins
" Plug 'junegunn/vim-easy-align' " quick align
" Plug 'yonchu/accelerated-smooth-scroll' " <C-D>/<C-U> and <C-F>/<C-B> keys are replaced by default.
" Plug 'fholgado/minibufexpl.vim' " Handle Buffers with Duplicate Name
" Plug 'gcmt/wildfire.vim' " Code and files fuzzy finder
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'thinca/vim-quickrun' " quick run

" syntax plugin
" Plug 'vim-scripts/dbext.vim' " SQLComplete suporrt
" Plug 'vim-scripts/SQLComplete.vim'
" Plug 'plasticboy/vim-markdown', {'for': 'md'}
" Plug 'elzr/vim-json'
" Plug 'fisadev/vim-isort', {'do': 'pip install isort'} " isort  https://github.com/timothycrosley/isort#readme + https://github.com/fisadev/vim-isort#installation
" Plug 'tell-k/vim-autopep8', {'do': 'pip install autopep8'} " :Autopep8, fix syntax
" Plug 'mattn/emmet-vim'

" Plug 'motemen/git-vim' " Git integration, git command
" Plug 'junegunn/vim-emoji' " emoji plugin

" Initialize plugin system
call plug#end()
