#!/bin/bash

PWD_DIR=`pwd`
echo 'installing..., current dir: ' $PWD_DIR
SYSTEM=`uname -s`

echo 'OS: ' $SYSTEM
if [ $SYSTEM = "Darwin" ]; then
    echo 'install brew...'
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    # vim tagbar need ctags
    brew install zsh git htop tmux vim neovim
    brew install python3 golang clang npm
    brew install ctags autojump nvm
    # ack, ag, pt or rg, support ctrlsf
    brew install ack the_silver_searcher
    brew install aria2 cloc tig jq curl
    # Fix tmux exited on osx
    brew install reattach-to-user-namespace
    # install powerline fonts, set terminal font support powerline
    git clone https://github.com/powerline/fonts.git ~/.fonts
    sh ~/.fonts/install.sh
elif [ $SYSTEM = "Linux" ]; then
    echo 'updating apt and install software'
    if which apt 2>&1 > /dev/null; then
        apt update
        apt install -y git htop vim zsh tmux neovim
        apt install -y gcc python3 python-dev curl tig
        apt install -y ctags cmake silversearcher-ag jq ack-grep
    elif which yum 2>&1 > /dev/null; then
        yum update
        yum install -y git htop vim zsh tmux neovim
        yum install -y gcc gcc-c++ python3.6 golang npm
        yum install -y ctags python-devel curl tig
        yum install -y cmake jq # ack-grep silversearcher-ag
    else
        exit 0
    fi
else
    echo 'Unsupport System!'
    exit 0
fi

# make workspace
mkdir ~/workspace

# make data
mkdir /data

# make go workspace
mkdir ~/workspace/go

# user bin
ln -s $PWD_DIR/bin ~/

# python
if [ -f ~/.pip ] ; then
    mv ~/.pip ~/.pip.old
fi
ln -s $PWD_DIR/.pip ~/
ln -s $PWD_DIR/.ipython ~/

# vim
if [ -f ~/.vimrc ] ; then
    mv ~/.vimrc ~/.vimrc.old
fi
ln -s $PWD_DIR/.vimrc ~/
if [ -f ~/.vim ] ; then
    mv ~/.vim ~/.vimrc.old
fi
ln -s $PWD_DIR/.vim ~/

# tmux
if [ -f ~/.tmux.conf ] ; then
    mv ~/.tmux.conf ~/.tmux.conf.old
fi
ln -s $PWD_DIR/.tmux.conf ~/

# git config
ln -s $PWD_DIR/.gitconfig ~/
ln -s $PWD_DIR/.gitignore.global ~/

# ycm extra config
ln -s $PWD_DIR/.ycm_extra_conf ~/.ycm_extra_conf.py

# flake8 config
ln -s $PWD_DIR/.flake8 ~/.flake8

# npm config
ln -s $PWD_DIR/.npmrc ~/.npmrc

# conda config
ln -s $PWD_DIR/.condarc ~/.condarc

# isort config
ln -s $PWD_DIR/.isort ~/.isort

# .config
if [ -f ~/.config ] ; then
    mv ~/.config ~/.config.old
fi
ln -s $PWD_DIR/.config ~/.config

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
if [ -f ~/.zshrc ] ; then
    mv ~/.zshrc ~/.zsh.old
fi
ln -s $PWD_DIR/.zshrc ~/.zshrc
source ~/.zshrc

# pyenv, https://github.com/pyenv/pyenv-installer.git
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

# system python path
pyenv global system

# create vim python env
virtualenv -p `which python3` /data/vimvenv
source /data/vimvenv/bin/activate

# pip
wget https://bootstrap.pypa.io/get-pip.py -O /tmp/get-pip.py && python /tmp/get-pip.py
pip install flake8 autopep8 cheat jedi ipython ipdb mycli forex-python simplejson yapf isort mypy neovim pyre

# virtualenv
virtualenv -p `which python3` ~/workspace/python3.6
