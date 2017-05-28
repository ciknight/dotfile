# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export SYSTEM=`uname -s`
# Set name of the theme to load.
ZSH_THEME="avit"
# Add wisely, as too many plugins slow down shell startup.
if [ $SYSTEM = "Darwin" ] ; then
    plugins=(git autojump pip redis-cli ssh-agent sudo tmux brew osx)
elif [ $SYSTEM = "Linux" ] ; then
    plugins=(git autojump pip redis-cli ssh-agent sudo tmux)
fi

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$HOME/bin:$PATH"; 
source $ZSH/oh-my-zsh.sh
# You may need to manually set your language environment
export LANG=zh_CN.UTF-8
export SSH_KEY_PATH="~/.ssh/id_rsa"
# Fix linux git diff chinese 
export LESSCHARSET=utf-8
# Fix python shell failed to write data to stream
export PYTHONIOENCODING=UTF-8
export GOPATH="$HOME/workspace/go"


# system alias
alias vi='vim'
alias ssh='ssh -2'
alias df='df -h'
alias du='du -h'
alias last='last -n 10'
alias now='date +"%Y-%m-%d %T"'
alias pg='ps -ef | grep'
alias ports='netstat -tulanp'
alias pong='ping -c 5 ' # ping，限制
# soft alias
alias py='python'
alias py27='source ~/.zshrc;source ~/workspace/python2.7/bin/activate'
alias py34='source ~/.zshrc;source ~/workspace/python3.4/bin/activate'
alias py35='source ~/.zshrc;source ~/workspace/python3.5/bin/activate'
alias py36='source ~/.zshrc;source ~/workspace/python3.6/bin/activate'
alias tl='tmux ls'
alias tn='tmux -2 new -s'
alias ta='tmux -2 attach -t' # -2 Force tmux to assume the terminal supports 256 colours.
alias tinit=tmuxinit
alias rm=safe_rm
alias weather='curl wttr.in/shanghai'
alias myip='curl ip.cn' # 'http://ipecho.net/plain;echo'
alias rmpyc='find . -name "*.pyc" -exec rm -rf {} \; >> /dev/null 2>&1'  # 递归删除目录下所有pyc
# local alias
local_alias=~/.local_alias.sh
if [ -f $local_alias ]; then
    source $local_alias
fi

PS1_BAK=$PS1
# vim backend sign
if [ $MYVIMRC ]; then
    PS1='(vim)'$PS1
else
    PS1=$PS1_BAK
fi
# ^Z Toggle vim
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

if [ $SYSTEM = "Darwin" ] ; then
    # brew cdn
    export HOMEBREW_BOTTLE_DOMAIN=http://7xkcej.dl1.z0.glb.clouddn.com
    # autojump
    [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
    # JAVA_HOME
    export JAVA_HOME=$(/usr/libexec/java_home)
    export PATH=$JAVA_HOME/bin:$PATH
elif [ $SYSTEM = "Linux" ] ; then
    # TODO doing somthing
fi

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# default ptyhon venv
source ~/workspace/python3.4/bin/activate

#if [[ "$TERM" != "screen-256color" ]]
#then
#    tmux attach-session -t "$USER" || tmux new-session -s "$USER"
#    exit
#fi
