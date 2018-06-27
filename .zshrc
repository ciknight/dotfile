# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export SYSTEM=`uname -s`

# Set name of the theme to load.
# ZSH_THEME="avit"
ZSH_THEME="af-magic"  # must be before source oh-my-zsh.sh

# Add wisely, as too many plugins slow down shell startup.
if [ $SYSTEM = "Darwin" ] ; then
    plugins=(git autojump pip redis-cli ssh-agent sudo tmux brew osx docker pyenv)
elif [ $SYSTEM = "Linux" ] ; then
    plugins=(git autojump pip redis-cli ssh-agent sudo tmux docker apt yum systemd pyenv)
fi

source $ZSH/oh-my-zsh.sh

if [ $SYSTEM = "Darwin" ] ; then
    # brew cdn
    export HOMEBREW_BOTTLE_DOMAIN=http://7xkcej.dl1.z0.glb.clouddn.com
    # autojump
    [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
    # JAVA_HOME
    export JAVA_HOME=$(/usr/libexec/java_home)
    export PATH=$PATH:$JAVA_HOME/bin
elif [ $SYSTEM = "Linux" ] ; then
    # Fix Home/END key not working in Tmux  https://github.com/neovim/neovim/issues/8032
    export TERM=tmux
fi

export PATH="$HOME/bin:$PATH";
export LANG=zh_CN.UTF-8  # You may need to manually set your language environment
export LESSCHARSET=utf-8  # Fix linux git diff and log chinese
export PYTHONIOENCODING=UTF-8  # Fix python shell failed to write data to stream
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
export HISTORY_IGNORE="poweroff|reboot|halt|shutdown|xlogout|exit|who"

# System alias
if which nvim 2>&1 > /dev/null; then
  alias vi=nvim
elif which vim 2>&1 > /dev/null; then
  alias vi=vim
else
  alias vi=vi
fi
alias ssh='ssh -2'
alias df='df -h'
alias du='du -h -d 1' # deep
alias last='last -n 10'
alias now='date +"%Y-%m-%d %T"'
alias pg='ps -ef | grep'
alias ports='netstat -tulanp'
alias pong='ping -c 5 ' # ping, 限制
alias tailf='tail -f'

# Git alias
alias gdc='git diff --cached'

# soft alias
alias py27='source ~/.zshrc;source ~/workspace/python2.7/bin/activate'
alias py36='source ~/.zshrc;source ~/workspace/python3.6/bin/activate'
alias tn='tmux -2 new -s'
alias ta='tmux -2 attach -t' # -2 Force tmux to assume the terminal supports 256 colours.
alias rm=safe_rm
alias cp=smart_cp
alias weather='curl wttr.in/~上海'
alias myip='curl myip.ipip.net' # 'http://ipecho.net/plain;echo'
alias rmpyc='find . -name "*.pyc" -exec rm -rf {} \; >> /dev/null 2>&1'  # 递归删除目录下所有pyc
alias resdns='dscacheutil -flushcache'
alias netlisten='lsof -i -P | grep -i "listen"'
alias seed='vim /tmp/`timestamp`.md'
alias mobi-agent='ssh-add ~/.ssh/mobi_rsa' # ssh-agent zsh
alias cvenv='python3 -m venv venv; source venv/bin/activate'
alias avenv='source venv/bin/activate'

# local alias, default ptyhon venv set here
zshrc_local=~/.zshrc_local
if [ -f $zshrc_local ]; then
    source $zshrc_local
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
