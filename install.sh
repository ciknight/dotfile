#!/bin/bash

PWD_DIR=`pwd`
echo 'installing..., current dir: ' $PWD_DIR
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
    fi
    brew install zsh git htop tmux
    brew install golang
    curl -sL install-node.now.sh/lts | bash
    curl -o- -L https://yarnpkg.com/install.sh | bash
    curl https://sh.rustup.rs -sSf | bash

    # ack, ag, pt or rg, support vim ctrlsf and tagbar
    brew install ack the_silver_searcher ctags
    brew install cloc tig jq wget ncdu

    # Fix tmux exited on osx
    brew install reattach-to-user-namespace

    # Install neovim
    if hash nvim 2> /dev/null; then
        echo 'Already install neovim'
    else
        wget -O $PWD_DIR/opt/nvim-macos.tar.gz https://github.com/neovim/neovim/releases/download/v0.4.2/nvim-macos.tar.gz
        tar xzvf $PWD_DIR/opt/nvim-macos.tar.gz -C $PWD_DIR/opt/
        echo 'Input passwd, link neovim'
        sudo ln -s $PWD_DIR/opt/nvim-macos/bin/nvim /usr/local/bin/nvim
    fi

    # brew cask install java

    # install powerline fonts, set terminal font support powerline
    # git clone https://github.com/powerline/fonts.git ~/.fonts
    # wget https://gist.github.com/baopham/1838072/raw/616d338cea8b9dcc3a5b17c12fe3070df1b738c0/Monaco%2520for%2520Powerline.otf
    # sh ~/.fonts/install.sh
elif [ $SYSTEM = "Linux" ]; then
    echo 'updating apt and install software'
    if which apt 2>&1 > /dev/null; then
        apt update
        apt install -y git htop vim zsh tmux neovim
        apt install -y gcc python3 python-dev curl tig
        apt install -y ctags cmake silversearcher-ag jq ack-grep
    elif which yum 2>&1 > /dev/null; then
        # yum -y install epel-release
        # yum -y install https://centos7.iuscommunity.org/ius-release.rpm  # CentOS 7,
        yum update
        yum install openssl-devel readline-devel sqlite-devel
        yum install -y git htop vim zsh tmux neovim
        yum install -y gcc gcc-c++ golang npm
        yum install -y ctags python-devel curl tig
        yum install -y cmake jq ack-grep the_silver_searcher
        yum install -y fd-find
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
    mkdir -p $HOME/workspace/go/{bin,pkg,src}
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
ln -s $PWD_DIR/.pip ~/

if [ ! -f $PWD_DIR/opt/get-pip.py ] ; then
    echo 'Input passwd, install pip'
    wget https://bootstrap.pypa.io/get-pip.py -O $PWD_DIR/opt/get-pip.py && sudo $PYTHON $PWD_DIR/opt/get-pip.py
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
    # enable pyenv
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    export PYTHON_BUILD_MIRROR_URL="http://pyenv.qiniudn.com/pythons"
    eval "$(pyenv init -)"
    # Install python3.7
    pyenv install 3.7.4
    pyenv global 3.7.4
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
    virtualenv -p `which python3` ~/workspace/neovim3
    source ~/workspace/neovim3/bin/activate
    pip install pynvim flake8 mccabe flake8-isort flake8-bugbear flake8-comprehensions jedi yapf isort mypy ipdb
fi
#pip install mycli ipython ipdb cheat forex-python

# vim
#if [ -f ~/.vimrc ] ; then
#    mv ~/.vimrc ~/.vimrc.old
#fi
#ln -s $PWD_DIR/.vimrc ~/
#if [ -f ~/.vim ] ; then
#    mv ~/.vim ~/.vimrc.old
#fi
#ln -s $PWD_DIR/.vim ~/

# tmux
if [ ! -d ~/.tmux/plugins/tpm ] ; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
if [ -f ~/.tmux.conf ] ; then
    mv ~/.tmux.conf ~/.tmux.conf.old
fi
ln -s $PWD_DIR/.tmux.conf ~/

# ycm extra config
ln -s $PWD_DIR/.ycm_extra_conf ~/

# flake8 config
ln -s $PWD_DIR/.flake8 ~/

# npm config
ln -s $PWD_DIR/.npmrc ~/

# conda config
ln -s $PWD_DIR/.condarc ~/

# home bin
if [ ! -d ~/bin ]; then
    ln -s $PWD_DIR/bin ~/
fi

# ipython
if [ -d ~/.ipython ]; then
    mv ~/.ipython ~/.ipython.old
fi
ln -s $PWD_DIR/.ipython ~/

# isort config
if [ -d ~/.isort.cfg ]; then
    mv ~/.isort.cfg ~/.isort.cfg.old
fi
ln -s $PWD_DIR/.isort.cfg ~/

# mypy config
ln -s $PWD_DIR/.mypy.ini ~/

# ack config
ln -s $PWD_DIR/.ackrc ~/

# ag config
ln -s $PWD_DIR/.agignore ~/

# .config
if [ -d ~/.config ] ; then
    mv ~/.config ~/.config.old
fi
ln -s $PWD_DIR/.config ~/

# git config
ln -s $PWD_DIR/.gitconfig ~/
ln -s $PWD_DIR/.gitignore.global ~/

# zsh
if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
if [ ! -f ~/.zshrc ] ; then
    mv ~/.zshrc ~/.zsh.old
fi
ln -s $PWD_DIR/.zshrc ~/.zshrc
ln -s $PWD/.zshenv ~/.zshenv

# z jump around, use zsh plugin
#if hash z 2>/dev/null; then
#    wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O ~/.z.sh
#fi

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
source ~/.zshrc
