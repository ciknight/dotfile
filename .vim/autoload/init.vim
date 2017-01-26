" Setting up vim-plug - the vim plugin manager
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

" Plug manager
Plug 'junegunn/vim-plug'

" vim mark
" Plug 'kshenoy/vim-signature'

" Plug 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'

" 23333
Plug 'mhinz/vim-startify'

Plug 'vim-scripts/DfrankUtil'

" rainbow pair
Plug 'kien/rainbow_parentheses.vim'

" manage multipie project
Plug 'vim-scripts/vimprj'

Plug 'dyng/ctrlsf.vim'  " TODO study

" ctrlsf depend
Plug 'terryma/vim-multiple-cursors'

" quick annotation http://www.wklken.me/posts/2015/06/07/vim-plugin-nerdcommenter.html
Plug 'scrooloose/nerdcommenter'

" Draw ascii paint  http://www.opstool.com/article/178
" Plug 'vim-scripts/DrawIt'

" Indent line
Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesEnable' }

" TMUX
Plug 'tpope/vim-tbone'

" Plug 'AutoComplPop'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }

" generate ycm.conf
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" file tree
Plug 'scrooloose/nerdtree'

" Plug 'fholgado/minibufexpl.vim'  " Handle Buffers with Duplicate Name

" Plug 'gcmt/wildfire.vim'  " Code and files fuzzy finder

" auto create not exists dir
Plug 'pbrisbin/vim-mkdir'

" surroundings in pairs
Plug 'tpope/vim-surround'

" auto sign complate
" Plug 'Raimondi/delimitMate'

" Fold
Plug 'tmhedberg/SimpylFold'

" Track the engine.
Plug 'SirVer/ultisnips'  " http://mednoter.com/UltiSnips.html

" " Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'


""""""""""
" Git
""""""""""
" Git integration
Plug 'motemen/git-vim'

" powerline git status
Plug 'tpope/vim-fugitive'

" diff status
Plug 'airblade/vim-gitgutter'

" https://github.com/tpope/vim-endwise
Plug 'tpope/vim-endwise'


""""""""""""""
" Powerline
""""""""""""""
Plug 'Lokaltog/vim-powerline', { 'branch': 'develop' }

" Class/module browser, ctag support, suppoer powerline
Plug 'majutsushi/tagbar'

" auto filejump, support tagbar  http://www.wklken.me/posts/2015/06/07/vim-plugin-tagbar.html
Plug 'kien/ctrlp.vim'


""""""""""""""""""
" about language
"""""""""""""""""""
" Plug 'vim-syntastic/syntastic'

" python
Plug 'klen/python-mode'

Plug 'jmcantrell/vim-virtualenv'

" front end
Plug 'pangloss/vim-javascript'

Plug 'mattn/emmet-vim'

" XML/HTML tags navigation
Plug 'matchit.zip'

Plug 'Glench/Vim-Jinja2-Syntax'

Plug 'elzr/vim-json'


""""""""""
" Theme
""""""""""
Plug 'tomasr/molokai'  " i like it
Plug 'altercation/vim-colors-solarized'


" Initialize plugin system
call plug#end()

" Installing plugins the first time
if iCanHazPlugged == 0
    echo "Installing vim-plug, please ignore key map error messages"
    echo ""
    :PlugInstall
endif
