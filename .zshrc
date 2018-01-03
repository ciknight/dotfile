# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export SYSTEM=`uname -s`

# Set name of the theme to load.
# ZSH_THEME="avit"
ZSH_THEME="af-magic"  # must be before source oh-my-zsh.sh

# Add wisely, as too many plugins slow down shell startup.
if [ $SYSTEM = "Darwin" ] ; then
    plugins=(git autojump pip redis-cli ssh-agent sudo tmux brew osx)
elif [ $SYSTEM = "Linux" ] ; then
    plugins=(git autojump pip redis-cli ssh-agent sudo tmux)
fi

source $ZSH/oh-my-zsh.sh

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

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$HOME/bin:$PATH"; 
export LANG=zh_CN.UTF-8  # You may need to manually set your language environment
export LESSCHARSET=utf-8  # Fix linux git diff and log chinese
export PYTHONIOENCODING=UTF-8  # Fix python shell failed to write data to stream
export HOMEBREW_EDITOR=vim
export GOPATH="$HOME/workspace/go"  # Golang Path
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PYTHON_BUILD_MIRROR_URL="http://pyenv.qiniudn.com/pythons/"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# History
export HISTFILE=~/.zsh_histfile     # Where to save history.
export HISTSIZE=1000000             # How many lines in the current session to remember.
export SAVEHIST=1000000             # How many lines to save to disk. Must be <=HISTSIZE.
# Patterns to exclue. Separate with |. *-matching.
export HISTORY_IGNORE="poweroff|reboot|halt|shutdown|xlogout|exit"
# setopt appendhistory        # Append to history write on exit, do not overwrite.
# setopt histignoredups       # Do not save immediate duplicates lines in history.
# setopt histignorespace      # Ignore commands starting with space.
# setopt extendedhistory      # Save command time start and exec time in seconds.
# setopt histreduceblanks     # Strip redundant spaces.

# Git alias
alias gdc='git diff --cached'

# System alias
alias vi='vim'
alias ssh='ssh -2'
alias df='df -h'
alias du='du -h -d 1' # deep
alias last='last -n 10'
alias now='date +"%Y-%m-%d %T"'
alias pg='ps -ef | grep'
alias ports='netstat -tulanp'
alias pong='ping -c 5 ' # ping, 限制
alias tailf='tail -f'

# soft alias
alias py34='source ~/.zshrc;source ~/workspace/python3.4/bin/activate'
alias py36='source ~/.zshrc;source ~/workspace/python3.6/bin/activate'
alias tl='tmux ls'
alias tn='tmux -2 new -s'
alias ta='tmux -2 attach -t' # -2 Force tmux to assume the terminal supports 256 colours.
alias tinit=tmuxinit
alias rm=safe_rm
alias cp=smart_cp
alias weather='curl wttr.in/~上海'
alias myip='curl myip.ipip.net' # 'http://ipecho.net/plain;echo'
alias rmpyc='find . -name "*.pyc" -exec rm -rf {} \; >> /dev/null 2>&1'  # 递归删除目录下所有pyc
alias resdns='dscacheutil -flushcache'
alias netlisten='lsof -i -P | grep -i "listen"'
alias seed='vim /tmp/`timestamp`.md'
alias mobi-agent='ssh-add ~/.ssh/mobi_rsa' # ssh-agent zsh

# local alias, default ptyhon venv set here
# source ~/workspace/python3.6/bin/activate
zsh_local=~/.zsh_local
if [ -f $zsh_local ]; then
    source $zsh_local
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

# if [[ "$TERM" != "screen-256color" ]]
# then
#     tmux attach-session -t "$USER" || tmux new-session -s "$USER"
#     exit
# fi
