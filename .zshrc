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

# alias
if [ $SYSTEM = "Darwin" ] ; then
    alias free='top -l 1 | head -n 10 | grep PhysMem'
fi
alias vi=vim
alias rm=safe_rm
alias ta='tmux attach -t'
alias tn='tmux new -s'
alias tl='tmux list'
alias t=tmuxinit
alias g=git
alias py=python
alias ipy=ipython
alias py2='source ~/.zshrc;source ~/workspace/python2.7/bin/activate'
alias py3='source ~/.zshrc;source ~/workspace/python3.6/bin/activate'

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

# brew cdn
if [ $SYSTEM = "Darwin" ] ; then
    export HOMEBREW_BOTTLE_DOMAIN=http://7xkcej.dl1.z0.glb.clouddn.com
fi

# autojump
if [ $SYSTEM = "Darwin" ] ; then
    [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
elif [ $SYSTEM = "Linux" ] ; then
    # TODO doing somthing
fi

# default ptyhon venv
source ~/workspace/python3.6/bin/activate
# Fix python shell failed to write data to stream
export PYTHONIOENCODING=UTF-8

# JAVA_HOME
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$JAVA_HOME/bin:$PATH

# Fix linux git diff chinese 
export LESSCHARSET=utf-8

#if [[ "$TERM" != "screen-256color" ]]
#then
#    tmux attach-session -t "$USER" || tmux new-session -s "$USER"
#    exit
#fi
