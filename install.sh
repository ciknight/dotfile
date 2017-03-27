#!/bin/bash

PWD_DIR=`pwd`
echo 'installing..., current dir: ' $PWD_DIR
SYSTEM=`uname -s`

echo 'OS: ' $SYSTEM
if [ $SYSTEM = "Darwin" ] ; then
    echo 'install brew...'
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    # vim tagbar need ctags
    brew install git htop vim zsh tmux autojump python3 ctags clang golang
    # ack, ag, pt or rg, support ctrlsf
    brew install ack
    brew install aria2, cloc
    # brew install Caskroom/cask/go2shell
    # Fix tmux exited on osx
    brew install reattach-to-user-namespace
    # Python env
    brew install pyenv
    curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
    pyenv install 3.4.5
elif [ $SYSTEM = "Linux" ] ; then
    echo 'updating apt and install software'
    sudo apt-get update
    sudo apt-get install -y wget git htop vim zsh tmux ctags python-dev
fi

# python
ln -s $PWD_DIR/.pip ~/
ln -s $PWD_DIR/.ipython ~/
wget https://bootstrap.pypa.io/get-pip.py -O /tmp/get-pip.py && sudo python /tmp/get-pip.py
sudo pip install virtualenv
mkdir -p ~/workspace
virtualenv ~/workspace/python2.7

pyenv global 3.4.5
wget https://bootstrap.pypa.io/get-pip.py -O /tmp/get-pip.py && sudo python3 /tmp/get-pip.py
virtualenv -p `which python3` ~/workspace/python3.4

pyenv global system
wget https://bootstrap.pypa.io/get-pip.py -O /tmp/get-pip.py && sudo python3 /tmp/get-pip.py
virtualenv -p `which python3` ~/workspace/python3.6

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
