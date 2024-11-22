#!/usr/bin/env bash
source util.sh

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

set -e

echo ''


setup_workspace() {
    # Initialize workspace
    if [ ! -d ~/workspace ]; then
        # Make workspace directory
        mkdir ~/workspace
        # Make go workspace directory
        mkdir -p ~/workspace/go/{bin,pkg,src}
        # Make coc-vim typings path directory
        mkdir -p ~/.cache/typings
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

install_dotfiles () {
    info "installing dotfiles"

    local overwrite_all=false backup_all=false skip_all=false

    for src in $(find -H "$DOTFILES_ROOT/config" -maxdepth 2 -name '*.symlink' -not -path '*.git*')
    do
        dst="$HOME/.$(basename "${src%.*}")"
        echo $src
        echo $dst
        link_file "$src" "$dst"
    done

    success 'dotfiles'
}


install_software () {
    source ./install.sh
}


setup_workspace
setup_gitconfig
install_dotfiles

#if [ "$(uname -s)" == "Darwin" ]; then
#    info "installing dependencies"
#    if source bin/dot | while read -r data; do info "$data"; done
#    then
#        success "dependencies installed"
#    else
#        fail "error installing dependencies"
#    fi
#fi

echo ''
echo '  All installed!'

