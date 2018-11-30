#!/bin/bash

PWD_DIR=`pwd`
echo 'installing..., current dir: ' $PWD_DIR
SYSTEM=`uname -s`

echo 'OS: ' $SYSTEM
if [ $SYSTEM = "Darwin" ]; then
    # disable command + q
    # first, install git and initialize ssh key
    echo 'install brew...'
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    # vim tagbar need ctags
    brew install zsh git htop tmux vim neovim
    brew install python3 golang clang npm
    brew install ctags ncdu
    # ack, ag, pt or rg, support ctrlsf
    brew install ack the_silver_searcher
    brew install aria2 cloc tig jq wget fd
    # Fix tmux exited on osx
    brew install reattach-to-user-namespace
    # install powerline fonts, set terminal font support powerline
    git clone https://github.com/powerline/fonts.git ~/.fonts
    # wget https://gist.github.com/baopham/1838072/raw/616d338cea8b9dcc3a5b17c12fe3070df1b738c0/Monaco%2520for%2520Powerline.otf
    sh ~/.fonts/install.sh
elif [ $SYSTEM = "Linux" ]; then
    echo 'updating apt and install software'
    if which apt 2>&1 > /dev/null; then
        apt update
        apt install -y git htop vim zsh tmux neovim
        apt install -y gcc python3 python-dev curl tig
        apt install -y ctags cmake silversearcher-ag jq ack-grep fd-find
    elif which yum 2>&1 > /dev/null; then
        #yum -y install https://centos7.iuscommunity.org/ius-release.rpm
        yum update
        yum install openssl-devel readline-devel sqlite-devel
        yum install -y git htop vim zsh tmux neovim
        yum install -y gcc gcc-c++ golang npm
        #yum install -y python36
        #yum install -y python3.6
        #yum -y install python36u
        yum install -y ctags python-devel curl tig
        yum install -y cmake jq ack-grep the_silver_searcher
        yum install -y fd-find
    else
        exit 0
    fi
else
    echo 'Unsupport System!'
    exit 0
fi

# ssh
if [ ! -f ~/.ssh/id_rsa ] ; then
    ssh-keygen -t rsa -b 4096 -C "ci_knight@msn.cn"
fi

# make workspace
mkdir ~/workspace

# make go workspace
mkdir ~/workspace/go

# user bin
ln -s $PWD_DIR/bin ~/

# python
if [ -d ~/.pip ] ; then
    mv ~/.pip ~/.pip.old
fi
ln -s $PWD_DIR/.pip ~/
ln -s $PWD_DIR/.ipython ~/
PYTHON=`which python`
PYTHON3=`which python3.6`

# pyenv, https://github.com/pyenv/pyenv-installer.git
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

# pip
if [ ! -f /tmp/get-pip.py ] ; then
    wget https://bootstrap.pypa.io/get-pip.py -O /tmp/get-pip.py && $PYTHON /tmp/get-pip.py && $PYTHON3 install /tmp/get-pip.py
fi
# system python path
pyenv global system
pip install virtualenv pipenv

# create neovim python env
if [ ! -d ~/workspace/neovim3 ] ; then
    virtualenv -p $PYTHON3 ~/workspace/neovim3
    source ~/workspace/neovim3/bin/activate
    pip install pynvim flake8 flake8-isort flake8-bugbear jedi yapf isort mypy
fi
#pip install mycli ipython ipdb cheat forex-python

# vim
if [ -f ~/.vimrc ] ; then
    mv ~/.vimrc ~/.vimrc.old
fi
ln -s $PWD_DIR/.vimrc ~/
if [ -f ~/.vim ] ; then
    mv ~/.vim ~/.vimrc.old
fi
ln -s $PWD_DIR/.vim ~/

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
if [ -f ~/.zshrc ] ; then
    mv ~/.zshrc ~/.zsh.old
fi
ln -s $PWD_DIR/.zshrc ~/
source ~/.zshrc

# tmux
if [ ! -d ~/.tmux/plugins/tpm ] ; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
if [ -f ~/.tmux.conf ] ; then
    mv ~/.tmux.conf ~/.tmux.conf.old
fi
ln -s $PWD_DIR/.tmux.conf ~/

# z jump around
wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O ~/.z.sh

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# ycm extra config
ln -s $PWD_DIR/.ycm_extra_conf ~/

# flake8 config
ln -s $PWD_DIR/.flake8 ~/

# npm config
ln -s $PWD_DIR/.npmrc ~/

# conda config
ln -s $PWD_DIR/.condarc ~/

# isort config
ln -s $PWD_DIR/.isort.cfg ~/

# mypy config
ln -s $PWD_DIR/.mypy.ini ~/

# mypy config
ln -s $PWD_DIR/.ackrc ~/

# .config
if [ -d ~/.config ] ; then
    mv ~/.config ~/.config.old
fi
ln -s $PWD_DIR/.config ~/

# git config
ln -s $PWD_DIR/.gitconfig ~/
ln -s $PWD_DIR/.gitignore.global ~/
