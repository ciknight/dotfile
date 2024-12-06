#!/usr/bin/env bash
source util.sh

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

set -e

echo ''


setup_workspace() {
    # Initialize workspace
    if [ ! -d ~/workspace ]; then
        info 'setup workspace'
        # Make workspace directory
        mkdir ~/workspace
        # Make go workspace directory
        mkdir -p ~/workspace/go/{bin,pkg,src}
        # Make coc-vim typings path directory
        mkdir -p ~/.cache/typings

        success 'workspace'
    fi
    if [ ! -d ~/.config ]; then
        mkdir ~/.config
    fi
    if [ ! -d ~/bin ]; then
        ln -s $PWD/bin ~/
    fi
}

setup_gitconfig () {
    if ! [ -f config/git/gitconfig.local.symlink ]
    then
        info 'setup gitconfig'
        git_credential='cache'
        if [ "$(uname -s)" == "Darwin" ]
        then
            git_credential='osxkeychain'
        fi
        user ' - What is your github author name?'
        read -e git_authorname
        user ' - What is your github author email?'
        read -e git_authoremail

        sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" -e "s/GIT_CREDENTIAL_HELPER/$git_crendential/g" config/git/gitconfig.local.symlink.example > config/git/gitconfig.local.symlink

        success 'gitconfig'
    fi
}

install_software () {
    . ./scripts/install.sh
    . ./config/python/install.sh
    . ./config/nvim/install.sh
    . ./config/zsh/install.sh
}

install_dotfiles () {
    info "installing dotfiles"

    local overwrite_all=false backup_all=false skip_all=false

    for src in $(find -H "$DOTFILES_ROOT/config" -maxdepth 2 -name '*.symlink' -not -path '*.git*')
    do
        dst="$HOME/.$(basename "${src%.*}")"
        link_file "$src" "$dst"
    done

    bash ./config/nvim/bootstrap.sh
    bash ./config/python/bootstrap.sh

    success 'dotfiles'
}


setup_workspace
setup_gitconfig
install_software
install_dotfiles

echo ''
echo '  All installed!'

