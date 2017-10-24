#!/bin/bash

PWD_DIR=`pwd`
echo 'installing..., current dir: ' $PWD_DIR
SYSTEM=`uname -s`

echo 'OS: ' $SYSTEM
if [ $SYSTEM = "Darwin" ] ; then
    echo 'install brew...'
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    # vim tagbar need ctags
    brew install git htop vim zsh tmux ctags python3 clang golang autojump 
    # brew install Caskroom/cask/go2shell
    # ack, ag, pt or rg, support ctrlsf
    brew install ack
    brew install aria2, cloc
    # Fix tmux exited on osx
    brew install reattach-to-user-namespace
    # Python env
    # brew install pyenv
elif [ $SYSTEM = "Linux" ] ; then
    echo 'updating apt and install software'
    apt-get update
    apt-get install -y git htop vim zsh tmux ctags python3 python-dev curl
    apt-get install -y cmake
fi

# pyenv
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

# python
ln -s $PWD_DIR/.pip ~/
ln -s $PWD_DIR/.ipython ~/

# pip
wget https://bootstrap.pypa.io/get-pip.py -O /tmp/get-pip.py && python /tmp/get-pip.py

# system python path
# pyenv mirrors set PYTHON_BUILD_MIRROR_URL env
pyenv global system
pip install flake8 autopep8 cheat isort jedi ipython ipdb
# virtualenv -p `which python3` ~/workspace/python3.6

# go workspace
mkdir -p ~/workspace/go

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

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
if [ -f ~/.zshrc ] ; then
    mv ~/.zshrc ~/.zsh.old
fi
ln -s $PWD_DIR/.zshrc ~/

# ycm
ln -s $PWD_DIR/.ycm_extra_conf ~/.ycm_extra_conf.py

# flake8
ln -s $PWD_DIR/.flake8 ~/.flake8

# npm mirrors
ln -s $PWD_DIR/.npmrc ~/.npmrc

# conda mirrors
ln -s $PWD_DIR/.condarc ~/.condarc
