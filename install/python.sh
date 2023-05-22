#! /bin/sh

install_py () {
    #### Link pip config
    if [ -d ~/.pip ] ; then
        mv ~/.pip ~/.pip.old
    fi
    ln -s $PWD/config/python/pip $HOME/.pip

    #### Install pyenv and python3
    if hash pyenv 2>/dev/null; then
        echo 'Already install pyenv'
    else
        if [ -d ~/.pyenv ] ; then
            mv ~/.pyenv ~/.pyenv.old
        fi
        # pyenv, https://github.com/pyenv/pyenv-installer.git
        curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
        mkdir $(pyenv root)/cache

        # install plugin pyenv-alias
        git clone https://github.com/s1341/pyenv-alias.git $(pyenv root)/plugins/pyenv-alias

        # enable pyenv
        export PYENV_ROOT="$HOME/.pyenv"
        export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
        export PYTHON_BUILD_MIRROR_URL="https://pyenv.ibeats.top"
        eval "$(pyenv init --path)"
        eval "$(pyenv init -)"

        # install python3
        pyenv install 3.10.11
        pyenv global 3.10.11
    fi

    #### Install pip
    PYTHON=`which python`
    if [ ! -f $PWD/opt/get-pip.py ] ; then
        # python -m ensurepip --upgrade
        echo 'Input passwd, install pip'
        wget https://bootstrap.pypa.io/get-pip.py -O $PWD/opt/get-pip.py && sudo $PYTHON $PWD/opt/get-pip.py
        # python util
        sudo pip install virtualenv pipenv
    fi


    if [ -d ~/.ipython ]; then
        mv ~/.ipython ~/.ipython.old
    fi
    ln -s $PWD/config/python/ipython $HOME/.ipython

    ln -s $PWD/config/python/pyrightconfig.json $HOME/.config/pyrightconfig.json

    ln -s $PWD/config/python/ruff.toml $HOME/.config/ruff.toml

    # Deprecated
    #ln -s $PWD/config/python/isort.cfg $HOME/.isort.cfg
    #ln -s $PWD/config/python/mypy.ini $HOME/.mypy.ini
    #ln -s $PWD/config/python/flake8 $HOME/.flake8
    #ln -s $PWD/config/python/ycm_extra_conf.py $HOME/.ycm_extra_conf.py
    echo "Install python done"
}

uninstall_py () {
    # TODO: implement
    echo "implement"
}
