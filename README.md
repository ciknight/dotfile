## Configuration

Master为配置安装方法，平台请选择分支

## Dependency

- zsh
- tmux
- vim
- git
- python2.X
- autojump
- pip
- virtualenv
- ipython

## Copy配置文件

```
ln -s `pwd`/* ~/
or
cp -r `pwd`/* ~/
```

## Instal Dependency

#### __OSX__

软件安装

```
# 安装brew
/usr/bin/ruby -e "$(curl -fsSLhttps://raw.githubusercontent.com/Homebrew/install/master/install)"
# 安装软件依赖
brew install zsh tmux vim git python autojump wget
```

python相关

```
# 安装pip
wget https://bootstrap.pypa.io/get-pip.py -O /tmp/get-pip.py && python /tmp/get-pip.py
or
easy_install install pip
# 保持你的pip最新，pip install pip --upgrade
# 安装python基础包，可选
sudo pip install requests ipython virtualenv
# 创建python虚拟环境，为了不污染系统
mkdir ~/workspace && cd ~/workspace && virtualenv python2.7
```

oh~my~zsh

```
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
or
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

vim配置

```
# Vundle 安装
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# 安装插件
vim +PluginInstall +qall
# 编译YCM，如果需要对C-family的语义支持
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
```

####  __Linux__

**暂无**

## 配置描述

pip使用豆瓣源，建议不要使用aliyun等，豆瓣目前是我使用最稳定的源。pip8.1之后第三方源要配置trusted-host
