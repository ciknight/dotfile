# Dotfile

welcome to my dotfile

### 软件依赖

- vim8
- zsh
- tmux
- git
- python2
- python3
- autojump
- pip
- virtualenv

### 安装

sh install.sh


### Test your zsh speed

```
\time zsh -i -c exit
```

### Clean `/usr/local/bin`

```shell
cd /usr/local/bin/
rm flake8 black mypy isort
```

### Upgrade neovim virtualenv

```shell
pip freeze | awk -F '=' '{print $1}' | xargs pip install --upgrade
```


### Enable vscode key-repeat

https://github.com/VSCodeVim/Vim#vscodevim-settings

Run in shell

> defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

### TODO
