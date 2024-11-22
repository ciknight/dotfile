#! /bin/sh

install_python () {
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
        pyenv install 3.11.10
        pyenv global 3.11.10
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

    echo "Install python done"
}
