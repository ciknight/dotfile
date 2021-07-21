#! /bin/sh

install () {
    ln -s $PWD/config/git/gitconfig $HOME/.gitconfig
    ln -s $PWD/config/git/gitignore.global $HOME/.gitignore.global
    ln -s $PWD/config/git/gitmessage $HOME/.gitmessage
}

uninstall () {
    # TODO: implement
    echo "implement"
}
