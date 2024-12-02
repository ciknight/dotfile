#! /bin/sh
source util.sh

cd "$(dirname "$0")/.."
ROOT=$(pwd -P)


bootstrap () {
    local overwrite_all=false backup_all=false skip_all=false
    link_file $ROOT/nvim $HOME/.config/nvim
}

bootstrap
