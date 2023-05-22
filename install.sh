#!/bin/bash
echo 'installing..., current dir: ' $PWD
SYSTEM=`uname -s`

# first, initialize ssh key
if [ ! -f ~/.ssh/id_rsa ] ; then
    ssh-keygen -t rsa -b 4096 -C "ci_knight@msn.cn"
fi

echo 'OS: ' $SYSTEM
if [ $SYSTEM = "Darwin" ]; then
    # disable command + q
    if hash brew 2> /dev/null; then
        echo 'Already install homebrew'
    else
        echo 'Install homebrew...'
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        # arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    fi

    # python dependency
    brew install openssl@1.1 readline sqlite3 xz zlib bzip2 libffi pkg-config

    brew install golang
    curl -sL install-node.now.sh/lts | bash
    curl -o- -L https://yarnpkg.com/install.sh | bash
    curl https://sh.rustup.rs -sSf | bash

    # ack, ag, pt or rg, support vim ctrlsf and tagbar
    brew install ack the_silver_searcher ctags
    brew install zsh git htop lazygit ipcalc
    brew install cloc tig jq wget ncdu

    # Install tmux version 2.8
    # Fix tmux exited on osx
    brew install reattach-to-user-namespace

    # openvpn
    # https://apple.stackexchange.com/questions/203115/installed-openvpn-with-brew-but-it-doesnt-appear-to-be-installed-correctly

    # https://tclementdev.com/timemachineeditor/
    # brew install --cask timemachineeditor

    # Install neovim
    if hash nvim 2> /dev/null; then
        echo 'Already install neovim'
    else
        wget -O $PWD/opt/nvim-macos.tar.gz https://github.com/neovim/neovim/releases/download/v0.4.4/nvim-macos.tar.gz
        tar xzvf $PWD/opt/nvim-macos.tar.gz -C $PWD/opt/
        echo 'Input passwd, link neovim'
        sudo ln -s $PWD/opt/nvim-macos/bin/nvim /usr/local/bin/nvim
    fi

    # brew install --cask java or download java sdk.

    # install powerline fonts, set terminal font support powerline
    # git clone https://github.com/powerline/fonts.git ~/.fonts
    # wget https://gist.github.com/baopham/1838072/raw/616d338cea8b9dcc3a5b17c12fe3070df1b738c0/Monaco%2520for%2520Powerline.otf
    # sh ~/.fonts/install.sh

    # https://github.com/ryanoasis/nerd-fonts
    # curl -L https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/install.sh | bash

    # iterm Gruvbox Dark
    # https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Gruvbox%20Dark.itermcolors
elif [ $SYSTEM = "Linux" ]; then
    echo 'updating apt and install software'
    if which apt 2>&1 > /dev/null; then
        apt update
        apt install -y git htop vim zsh tmux neovim
        apt install -y gcc python3 python-dev curl tig lynx
        apt install -y ctags cmake silversearcher-ag jq ack-grep
    elif which yum 2>&1 > /dev/null; then
        # yum -y install epel-release
        # yum -y install https://centos7.iuscommunity.org/ius-release.rpm  # CentOS 7,
        yum update
        yum install openssl-devel readline-devel sqlite-devel
        yum install bzip2-devel libffi-devel python-devel
        yum install -y git htop vim zsh tmux neovim
        yum install -y cmake jq ack-grep the_silver_searcher fd-find ctags curl tig
        yum install -y gcc gcc-c++ golang npm
        curl -sL install-node.now.sh/lts | bash
        curl -o- -L https://yarnpkg.com/install.sh | bash
        # cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    else
        echo 'Unsupport Linux System'
        exit 0
    fi
else
    echo 'Unsupport System!'
    exit 0
fi

PYTHON=`which python`

if [ ! -d ~/workspace ]; then
    # make workspace
    mkdir ~/workspace
    # make go workspace
    mkdir -p ~/workspace/go/{bin,pkg,src}
    # coc-vim typings path
    mkdir -p ~/.cache/typings
fi

# rust
export PATH="$HOME/.cargo/bin:$PATH"
rustup toolchain install nightly
cargo +nightly install racer
git clone --depth=1 https://github.com/rust-lang/rust.git ~/workspace/rust

# golang
go get -u golang.org/x/tools/gopls@latest
go get -u golang.org/x/lint/golint
go get -u github.com/stamblerre/gocode

# pip
if [ -d ~/.pip ] ; then
    mv ~/.pip ~/.pip.old
fi
ln -s $PWD/.pip ~/

if [ ! -f $PWD/opt/get-pip.py ] ; then
    # python -m ensurepip --upgrade
    echo 'Input passwd, install pip'
    wget https://bootstrap.pypa.io/get-pip.py -O $PWD/opt/get-pip.py && sudo $PYTHON $PWD/opt/get-pip.py
    # python util
    sudo pip install virtualenv pipenv
fi

# pyenv
if hash pyenv 2>/dev/null; then
    echo 'Already install pyenv'
else
    if [ -d ~/.pyenv ] ; then
        mv ~/.pyenv ~/.pyenv.old
    fi
    # pyenv, https://github.com/pyenv/pyenv-installer.git
    curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
    mkdir $(pyenv root)/cache

    # install plugin pyenv-alias
    git clone https://github.com/s1341/pyenv-alias.git $(pyenv root)/plugins/pyenv-alias

    # enable pyenv
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
    export PYTHON_BUILD_MIRROR_URL="https://pyenv.ibeats.top"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    # Install python3
    pyenv install 3.9.13
    pyenv global 3.9.13
fi

# fzf
if hash fzf 2>/dev/null; then
    echo 'Already install fzf'
else
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

# create neovim python env
if [ ! -d ~/workspace/neovim3 ] ; then
    # VERSION_ALIAS="nvim" pyenv install 3.9.13
    virtualenv -p `which python3` ~/workspace/neovim3
    source ~/workspace/neovim3/bin/activate
    # mccabe  # check McCabe complexity
    # flake8-eradicate # Found commented out code
    pip install pynvim neovim-remote \
        flake8 \
        flake8-bugbear \
        flake8-comprehensions \
        flake8-black \
        flake8-todo \
        jedi black isort
fi

#pip install mycli ipython ipdb cheat forex-python ranger-fm

# vim
#if [ -f ~/.vimrc ] ; then
#    mv ~/.vimrc ~/.vimrc.old
#fi
#ln -s $PWD/.vimrc ~/
#if [ -f ~/.vim ] ; then
#    mv ~/.vim ~/.vimrc.old
#fi
#ln -s $PWD/.vim ~/

# tmux
if [ ! -d ~/.tmux/plugins/tpm ] ; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
if [ -f ~/.tmux.conf ] ; then
    mv ~/.tmux.conf ~/.tmux.conf.old
fi
ln -s $PWD/.tmux.conf ~/

# ycm extra config
#ln -s $PWD/.ycm_extra_conf ~/

# flake8 config
ln -s $PWD/.flake8 ~/

# npm config
ln -s $PWD/.npmrc ~/

# conda config
ln -s $PWD/.condarc ~/

# home bin
if [ ! -d ~/bin ]; then
    ln -s $PWD/bin ~/
fi

# ipython
if [ -d ~/.ipython ]; then
    mv ~/.ipython ~/.ipython.old
fi
ln -s $PWD/.ipython ~/

# isort config
if [ -d ~/.isort.cfg ]; then
    mv ~/.isort.cfg ~/.isort.cfg.old
fi
ln -s $PWD/.isort.cfg ~/

# mypy config
ln -s $PWD/.mypy.ini ~/

# ack config
ln -s $PWD/.ackrc ~/

# ag config
ln -s $PWD/.agignore ~/

# .config
if [ -d ~/.config ] ; then
    mv ~/.config ~/.config.old
fi
ln -s $PWD/.config ~/

# git config
ln -s $PWD/.gitconfig ~/
ln -s $PWD/.gitmessage ~/
ln -s $PWD/.gitignore.global ~/

# zsh
if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
if [ ! -f ~/.zshrc ] ; then
    mv ~/.zshrc ~/.zsh.old
fi
ln -s $PWD/.zshrc ~/
ln -s $PWD/.zshenv ~/

ln -s $PWD/pyrightconfig.json ~/

# zsh-autosuggestions, zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

source ~/.zshrc
