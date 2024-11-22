#! /bin/sh

install_git () {
    ln -s $PWD/config/git/gitconfig $HOME/.gitconfig
    ln -s $PWD/config/git/gitignore.global $HOME/.gitignore.global
    ln -s $PWD/config/git/gitmessage $HOME/.gitmessage
}

uninstall_git () {
    # TODO: implement
    echo "implement"
}
