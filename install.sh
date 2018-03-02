#!/bin/bash

PWD_DIR=`pwd`
echo 'installing..., current dir: ' $PWD_DIR
SYSTEM=`uname -s`

echo 'OS: ' $SYSTEM
if [ $SYSTEM = "Darwin" ]; then
    echo 'install brew...'
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    # vim tagbar need ctags
    brew install git htop vim neovim zsh tmux ctags clang golang autojump nvm
    # brew install Caskroom/cask/go2shell
    # ack, ag, pt or rg, support ctrlsf
    brew install ack the_silver_searcher
    brew install aria2 cloc tig jq
    # Fix tmux exited on osx
    brew install reattach-to-user-namespace
elif [ $SYSTEM = "Linux" ]; then
    echo 'updating apt and install software'
    if which apt 2>/dev/null; then
        apt-get update
        apt-get install -y git htop vim zsh tmux ctags python3 python-dev curl tig
        apt-get install -y cmake silversearcher-ag jq ack-grep
    elif which yum 2>/dev/null; then
        yum update
        yum install -y gcc gcc-c++
        yum install -y git htop vim zsh tmux ctags python3 python-devel golang curl tig
        yum install -y cmake jq # ack-grep silversearcher-ag
    else
        exit 0
    fi
else
    echo 'Unsupport System!'
    exit 0
fi

# mk workspace
mkdir ~/workspace

# go workspace
mkdir ~/workspace/go

# nvm dir
mkdir ~/.nvm

# python
ln -s $PWD_DIR/.pip ~/
ln -s $PWD_DIR/.ipython ~/

# vim
ln -s $PWD_DIR/.vimrc ~/
ln -s $PWD_DIR/.vim ~/

# tmux
if [ -f ~/.tmux.conf ] ; then
    mv ~/.tmux.conf ~/.tmux.conf.old
fi
ln -s $PWD_DIR/bin ~/
ln -s $PWD_DIR/.tmux.conf ~/

# git
ln -s $PWD_DIR/.gitconfig ~/
ln -s $PWD_DIR/.gitignore.global ~/

# ycm
ln -s $PWD_DIR/.ycm_extra_conf ~/.ycm_extra_conf.py

# flake8
ln -s $PWD_DIR/.flake8 ~/.flake8

# npm mirrors
ln -s $PWD_DIR/.npmrc ~/.npmrc

# conda mirrors
ln -s $PWD_DIR/.condarc ~/.condarc

# isort
ln -s $PWD_DIR/.isort.cfg ~/.isort.cfg

# install powerline fonts, set terminal font support powerline
git clone https://github.com/powerline/fonts.git ~/.fonts
sh ~/.fonts/install.sh

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

# pip
wget https://bootstrap.pypa.io/get-pip.py -O /tmp/get-pip.py && python /tmp/get-pip.py
# pip install isort flake8 autopep8 cheat isort jedi ipython ipdb mycli forex-python simplejson

# virtualenv
# virtualenv -p `which python3` ~/workspace/python3.6
