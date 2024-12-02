# Dotfiles

welcome to my dotfile

### 生成ssh key
if [ ! -f ~/.ssh/id_rsa ] ; then
    ssh-keygen -t rsa -b 4096 -C "andy@example.com"
fi

### 安装

> ./scripts/bootstrap.sh


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

### Enable vscode key-repeat(长按hjkl)

https://github.com/VSCodeVim/Vim#vscodevim-settings

Run in shell

> defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

### TODO
