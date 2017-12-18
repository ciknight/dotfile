" Setting up vim-plug - the vim plugin manager
" http://vimawesome.com/

let iCanHazPlugged=1
let plug_readme=expand('~/.vim/plugged/vim-plug/README.md')
if !filereadable(plug_readme)
    echo "Installing vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !mkdir -p ~/.vim/plugged
    silent !git clone https://github.com/junegunn/vim-plug ~/.vim/plugged/vim-plug
    silent !cp ~/.vim/plugged/vim-plug/plug.vim ~/.vim/autoload/plug.vim
    let iCanHazPlugged=0
endif

set rtp+=~/.vim/autoload/plug.vim
call plug#begin('~/.vim/plugged')

" -- alphe plugin
Plug 'junegunn/vim-plug'

" plugin help doc http://www.wklken.me

" -- display plugins
Plug 'junegunn/vim-emoji' " emoji plugin
Plug 'junegunn/vim-easy-align' " quick align
Plug 'mhinz/vim-startify' " 23333
Plug 'terryma/vim-multiple-cursors' " multipie cursor
Plug 'kien/rainbow_parentheses.vim' " rainbow pair
Plug 'Yggdroot/indentLine' " Indent line
" Plug 'kshenoy/vim-signature'  " vim mark


" -- windows plugins
Plug 'scrooloose/nerdtree' " nerdtree nerdtreetabs
Plug 'Xuyuanp/nerdtree-git-plugin' " nerdtree extend
Plug 'motemen/git-vim' " Git integration
Plug 'vim-airline/vim-airline' " airline
Plug 'vim-airline/vim-airline-themes' " airline themes
Plug 'tpope/vim-fugitive' " diff status
Plug 'airblade/vim-gitgutter' " airline git status
Plug 'tpope/vim-endwise' " https://github.com/tpope/vim-endwise
Plug 'tmhedberg/SimpylFold' " Fold


" -- function plugins
Plug 'thinca/vim-quickrun' " quick run
Plug 'vim-scripts/vimprj' " manage multipie project
Plug 'vim-scripts/DfrankUtil' " Vimprj dependency
Plug 'pbrisbin/vim-mkdir' " auto create not exists dir
Plug 'scrooloose/nerdcommenter' " quick annotation
Plug 'vim-scripts/DrawIt' " :DIstart or \di, Draw ascii paint  http://www.opstool.com/article/178
Plug 'terryma/vim-expand-region' " use V or v, region selected
Plug 'tpope/vim-surround' " surroundings in pairs, cs => change surring cst => tag, ds => delete, csw => add
Plug 'tpope/vim-repeat' " for repeat -> enhance surround.vim, use . to repeat command
Plug 'Raimondi/delimitMate' " auto sign complate
Plug 'tpope/vim-tbone' " TMUX
Plug 'christoomey/vim-tmux-navigator'
Plug 'godlygeek/tabular' " Vim script for text filtering and alignment


" -- search plugins
Plug 'dyng/ctrlsf.vim' " global seach, use :CtrlSF [pattern]
Plug 'mileszs/ack.vim' " CtrlSF dependency
Plug 'vim-scripts/matchit.zip' " % extend
Plug 'majutsushi/tagbar' " Class/module browser, ctag support, suppoer powerline
Plug 'kien/ctrlp.vim' " auto filejump, support tagbar  http://www.wklken.me/posts/2015/06/07/vim-plugin-tagbar.html


" -- autocomplate plugin
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --gocode-completer --clang-completer --system-libclang' }
Plug 'davidhalter/jedi-vim', {'do': 'pip install jedi'} " python use jdei, pip install jedi


" -- syntax plugin
Plug 'w0rp/ale', {'do': 'pip install flake8'} " syntax check
Plug 'tell-k/vim-autopep8', {'do': 'pip install autopep8'} " :Autopep8, fix syntax
Plug 'fisadev/vim-isort', {'do': 'pip install isort'} " isort  https://github.com/timothycrosley/isort#readme + https://github.com/fisadev/vim-isort#installation
Plug 'plasticboy/vim-markdown', {'for': 'md'}
Plug 'Shougo/vimshell.vim' " shell
Plug 'pangloss/vim-javascript' " front end
Plug 'mattn/emmet-vim'
Plug 'docunext/closetag.vim', {'for': ['html', 'xml']} " 自动补全html/xml标签
Plug 'elzr/vim-json'
Plug 'vim-scripts/dbext.vim' " SQLComplete suporrt
Plug 'vim-scripts/SQLComplete.vim'
Plug 'fatih/vim-go', {'for': 'go', 'on': 'GoInstallBinaries'} " Golang
Plug 'SirVer/ultisnips'  " http://mednoter.com/UltiSnips.html, Track the engine.
Plug 'honza/vim-snippets'  " Snippets are separated from the engine. Add this if you want them:


" -- Theme plugin
Plug 'tomasr/molokai'  " i like it
Plug 'altercation/vim-colors-solarized'


" -- closing plugins
" Plug 'yonchu/accelerated-smooth-scroll' " <C-D>/<C-U> and <C-F>/<C-B> keys are replaced by default.
" Plug 'fholgado/minibufexpl.vim' " Handle Buffers with Duplicate Name
" Plug 'gcmt/wildfire.vim' " Code and files fuzzy finder


" Initialize plugin system
call plug#end()

" Installing plugins the first time
if iCanHazPlugged == 0
    echo "Installing vim-plug, please ignore key map error messages"
    echo ""
    :PlugInstall
endif
