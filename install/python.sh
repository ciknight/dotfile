#! /bin/sh

install () {
    ln -s $PWD/config/python/flake8 $HOME/.flake8
    ln -s $PWD/config/python/ipython $HOME/.ipython
    ln -s $PWD/config/python/isort.cfg $HOME/.isort.cfg
    # ln -s $PWD/config/python/mypy.ini $HOME/.mypy.ini
    ln -s $PWD/config/python/pyrightconfig.json $HOME/.config/pyrightconfig.json
    ln -s $PWD/config/python/pip $HOME/.pip
    echo "install python done"
}

uninstall () {
    # TODO: implement
    echo "implement"
}
