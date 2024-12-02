#! /bin/sh
source util.sh

bootstrap () {
    local overwrite_all=false backup_all=false skip_all=false
    if ! test -d "$HOME/.pip"; then
        mkdir $HOME/.pip
    fi
    link_file pip.conf $HOME/.pip/pip.conf

    if ! test -d "$HOME/.ipython/profile_default"; then
        mkdir $HOME/.ipython/profile_default
    fi
    link_file ipython.conf $HOME/.ipython/profile_default
    link_file pyrightconfig.json $HOME/.config/pyrightconfig.json
    link_file ruff.toml $HOME/.config/ruff.toml
}

bootstrap
