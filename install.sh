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

    # ack, ag, pt or rg, support vim ctrlsf and tagbar
    brew install ack the_silver_searcher ctags
    brew install zsh git htop lazygit ipcalc
    brew install cloc tig jq wget ncdu

    brew install neovim

    # Install tmux version 2.8
    # Fix tmux exited on osx
    brew install reattach-to-user-namespace

    # openvpn
    # https://apple.stackexchange.com/questions/203115/installed-openvpn-with-brew-but-it-doesnt-appear-to-be-installed-correctly

    # https://tclementdev.com/timemachineeditor/
    # brew install --cask timemachineeditor
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
        apt install -y gcc curl tig lynx
        apt install -y ctags cmake silversearcher-ag jq ack-grep
        apt install -y golang npm
    elif which yum 2>&1 > /dev/null; then
        # yum -y install epel-release
        # yum -y install https://centos7.iuscommunity.org/ius-release.rpm  # CentOS 7,
        yum update
        yum install openssl-devel readline-devel sqlite-devel
        yum install bzip2-devel libffi-devel
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

# golang
go get -u golang.org/x/tools/gopls@latest
go get -u golang.org/x/lint/golint
go get -u github.com/stamblerre/gocode


# fzf
if hash fzf 2>/dev/null; then
    echo 'Already install fzf'
else
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi


# tmux
if [ ! -d ~/.tmux/plugins/tpm ] ; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
if [ -f ~/.tmux.conf ] ; then
    mv ~/.tmux.conf ~/.tmux.conf.old
fi
ln -s $PWD/.tmux.conf ~/

# npm config
ln -s $PWD/.npmrc ~/

# conda config
ln -s $PWD/.condarc ~/

# home bin
if [ ! -d ~/bin ]; then
    ln -s $PWD/bin ~/
fi

# ack config
ln -s $PWD/.ackrc ~/

# ag config
ln -s $PWD/.agignore ~/

# .config
if [ -d ~/.config ] ; then
    mv ~/.config ~/.config.old
fi
ln -s $PWD/.config ~/

# zsh
if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
if [ ! -f ~/.zshrc ] ; then
    mv ~/.zshrc ~/.zsh.old
fi
ln -s $PWD/.zshrc ~/
ln -s $PWD/.zshenv ~/

# zsh-autosuggestions, zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

source ~/.zshrc
