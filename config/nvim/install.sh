#! /bin/sh

install_neovim_python_dependency () {
    # create neovim python env
    if [ ! -d ~/workspace/neovim3 ] ; then
        # VERSION_ALIAS="nvim" pyenv install 3.9.13
        virtualenv -p `which python3` ~/workspace/neovim3
        source ~/workspace/neovim3/bin/activate
        # mccabe  # check McCabe complexity
        # flake8-eradicate # Found commented out code
        pip install pynvim neovim-remote \
            ruff \
            flake8 \
            flake8-bugbear \
            flake8-comprehensions \
            flake8-black \
            flake8-todo \
            jedi black isort
    fi
    #pip install mycli ipython ipdb cheat forex-python ranger-fm
}

