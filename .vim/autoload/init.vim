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

" Plug manager
Plug 'junegunn/vim-plug'
Plug 'junegunn/vim-emoji'

" vim mark, http://www.wklken.me/posts/2015/06/07/vim-plugin-signature.html
" Plug 'kshenoy/vim-signature'

" 23333
Plug 'mhinz/vim-startify'

" http://www.wklken.me/posts/2015/06/07/vim-plugin-multiplecursors.html
Plug 'terryma/vim-multiple-cursors'

" http://www.wklken.me/posts/2015/06/07/vim-plugin-easyalign.html
Plug 'junegunn/vim-easy-align'

" % extend
Plug 'vim-scripts/matchit.zip'

" http://www.wklken.me/posts/2015/06/13/vim-plugin-quickrun.html
Plug 'thinca/vim-quickrun'

" use V or v
Plug 'terryma/vim-expand-region'

" rainbow pair, http://www.wklken.me/posts/2015/06/07/vim-plugin-rainbowparentheses.html
Plug 'kien/rainbow_parentheses.vim'

" manage multipie project
Plug 'vim-scripts/vimprj'
" Vimprj dependcy
Plug 'vim-scripts/DfrankUtil'

" ":CtrlSF [pattern]
Plug 'dyng/ctrlsf.vim'
Plug 'mileszs/ack.vim'
" ctrlsf depend
Plug 'terryma/vim-multiple-cursors'

" quick annotation http://www.wklken.me/posts/2015/06/07/vim-plugin-nerdcommenter.html
Plug 'scrooloose/nerdcommenter'

" Draw ascii paint  http://www.opstool.com/article/178
" :DIstart or \di
Plug 'vim-scripts/DrawIt'

Plug 'vimwiki/vimwiki'

" Indent line
Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesEnable' }

" TMUX
Plug 'tpope/vim-tbone'
Plug 'christoomey/vim-tmux-navigator'

" generate ycm.conf
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Plug 'AutoComplPop'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --gocode-completer --clang-completer --system-libclang' }


" file tree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Handle Buffers with Duplicate Name
" Plug 'fholgado/minibufexpl.vim'

" Code and files fuzzy finder
" Plug 'gcmt/wildfire.vim'

" auto create not exists dir
Plug 'pbrisbin/vim-mkdir'

" surroundings in pairs
" cs => change surring cst => tag, ds => delete, csw => add
Plug 'tpope/vim-surround'
" for repeat -> enhance surround.vim, use . to repeat command
Plug 'tpope/vim-repeat'

" auto sign complate
Plug 'Raimondi/delimitMate'

" Fold
Plug 'tmhedberg/SimpylFold'

" <C-D>/<C-U> and <C-F>/<C-B> keys are replaced by default.
Plug 'yonchu/accelerated-smooth-scroll'

" Track the engine.
Plug 'SirVer/ultisnips'  " http://mednoter.com/UltiSnips.html
Plug 'justinj/vim-react-snippets'
" " Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" nerdtree nerdtreetabs
Plug 'scrooloose/nerdtree' | Plug 'jistr/vim-nerdtree-tabs'


""""""""""""""""""
" Git
""""""""""""""""""
" Git integration
Plug 'motemen/git-vim'

" powerline git status
Plug 'tpope/vim-fugitive'

" diff status
Plug 'airblade/vim-gitgutter'

" https://github.com/tpope/vim-endwise
Plug 'tpope/vim-endwise'


""""""""""""""""""
" airline
""""""""""""""""""
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Class/module browser, ctag support, suppoer powerline
Plug 'majutsushi/tagbar'

" auto filejump, support tagbar  http://www.wklken.me/posts/2015/06/07/vim-plugin-tagbar.html
Plug 'kien/ctrlp.vim'


""""""""""""""""""
" about language
""""""""""""""""""
Plug 'plasticboy/vim-markdown', {'for': 'md'}

" React native
Plug 'mxw/vim-jsx'

" python
Plug 'w0rp/ale', {'do': 'pip install flake8'}
" isort  https://github.com/timothycrosley/isort#readme + https://github.com/fisadev/vim-isort#installation
Plug 'fisadev/vim-isort', {'do': 'pip install isort'}

" shell
Plug 'Shougo/vimshell.vim'

" nginx
Plug 'evanmiller/nginx-vim-syntax'

" front end
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'

" 自动补全html/xml标签
Plug 'docunext/closetag.vim', {'for': ['html', 'xml']}

" XML/HTML tags navigation
Plug 'matchit.zip'

Plug 'elzr/vim-json'

Plug 'vim-scripts/SQLComplete.vim'
Plug 'vim-scripts/dbext.vim'

" Golang
Plug 'fatih/vim-go', {'for': 'go'}


""""""""""""""""""
" Theme
""""""""""""""""""
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