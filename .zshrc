# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="af-magic"  # must be before source oh-my-zsh.sh
export SYSTEM=`uname -s`

# Add wisely, as too many plugins slow down shell startup.
if [ $SYSTEM = "Darwin" ] ; then
    plugins=(git brew zsh-autosuggestions z)
elif [ $SYSTEM = "Linux" ] ; then
    plugins=(git systemd zsh-autosuggestions z)
fi
source $ZSH/oh-my-zsh.sh

if [ $SYSTEM = "Darwin" ] ; then
    # HomeBrew mirror, https://mirrors.tuna.tsinghua.edu.cn/help/homebrew/

    # JAVA_HOME
    if command -v java > /dev/null 2>&1; then
        # use java jdk, do not use openjdk
        export JAVA_HOME=$(/usr/libexec/java_home)
        export PATH=$PATH:$JAVA_HOME/bin

        # Android_SDK_HOME
        if [ -d "/opt/sdk" ]; then
            export ANDROID_SDK_HOME=/opt/sdk
            export PATH=$PATH:$ANDROID_SDK_HOME/platform-tools:$ANDROID_SDK_HOME/tools/bin
        fi
    fi

fi

# Path
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"
export WORKER_SSH_KEY_PATH="$HOME/.ssh/id_rsa"
# Fix Neovim mypy flake8 yapf isort bin path
export PATH="$HOME/bin:$PATH:$HOME/workspace/neovim3/bin"

# Language setting
export PYTHONIOENCODING=UTF-8  # Fix python shell failed to write data to stream
export LANG=en_US.UTF-8  # You may need to manually set your language environment, include remote server
export LC_ALL=en_US.UTF-8  # Fix pipenv LC
export LESSCHARSET=utf-8  # Fix linux git diff and log chinese

# Zsh History
export HISTFILE=$HOME/.zsh_histfile     # Where to save history.
export HISTSIZE=1000000             # How many lines in the current session to remember.
export SAVEHIST=1000000             # How many lines to save to disk. Must be <=HISTSIZE.
# Patterns to exclue. Separate with |. *-matching.
#export HISTORY_IGNORE="(poweroff|reboot|halt|shutdown|xlogout|exit|who|fzf|pwd|gl|gst|gbr|gdc|gb)"
setopt HIST_IGNORE_SPACE  # ignore duplicated commands history list
# setopt SHARE_HISTORY  # share command history data

# Zsh Autosuggest
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=110,underline"

# Load Z jump around, use zsh plugin
# source $HOME/.z.sh

# Pyenv
if [ -d "$HOME/.pyenv" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    export PYTHON_BUILD_MIRROR_URL="http://pyenv.qiniudn.com/pythons"
    eval "$(pyenv init -)"
fi

# Golang
if command -v go >/dev/null 2>&1; then
    export GOPATH="$HOME/workspace/go"  # Golang Path
    export PATH="$GOPATH/bin:$PATH"
    export GOPROXY=https://athens.azurefd.net
    export GO111MODULE=on
fi

# Pipenv
if command -v pipenv >/dev/null 2>&1; then
    export PIPENV_PYPI_MIRROR="https://pypi.tuna.tsinghua.edu.cn/simple"
    export PIPENV_IGNORE_VIRTUALENVS=1
    export PIPENV_VERBOSITY=-1
    # load very slow
    # eval "$(pipenv --completion)"
fi

# Fzf
if [ -f "$HOME/.fzf.zsh" ]; then
    export FZF_DEFAULT_COMMAND='ag -i -U --hidden -g ""'
    export FZF_DEFAULT_OPTS="--no-mouse --height 40% --reverse --border --prompt '>>>' \
        --bind 'alt-j:preview-down,alt-k:preview-up,ctrl-v:execute(nvim {})+abort,ctrl-y:execute-silent(cat {} | pbcopy)+abort,?:toggle-preview' \
        --header 'A-j/k: preview down/up, C-v: open in nvim, C-y: copy, ?: toggle preview' \
        --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -100'"
    # ctrl-t:fzf-file-widget
    # ctrl-r:serach-zsh-history
    source $HOME/.fzf.zsh
fi

# System software alias
#if which nvim 2>&1 > /dev/null; then
if command -v nvim >/dev/null 2>&1; then
  alias vi=nvim
elif command -v vim >/dev/null 2>&1; then
  alias vi=vim
else
  alias vi=vi
fi
alias ssh='ssh -A'
alias df='df -h'
alias du='du -h -d 1' # Path Deep
alias last='last -n 10'  # last login
alias now='date +"%Y-%m-%d %T"'
alias pg='ps -ef | grep'
alias ports='netstat -tulanp'
alias pong='ping -c 5 ' # Ping limited
alias tailf='tail -f'
alias reload='source ~/.zshrc'

# Git alias
alias gdc='git diff --cached'

# Other alias
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
alias worker-agent='ssh-add $HOME/.ssh/id_rsa' # ssh-agent zsh
alias cvenv='virtualenv -p `which python3` venv; source venv/bin/activate'
alias avenv='source venv/bin/activate'
alias pip=pipenv
alias vo='vi -o$#'
alias clntrash='\rm -rf ~/.trash/*'

# Docker alias
alias dorkrmall='docker ps --all | tail -n 8 | awk -F ' ' '{print $1}' | xargs docker rm'

# Toggle vim, usage ^z
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

# Load local zsh env
zshrc_local=$HOME/.zshrc_local
if [ -f $zshrc_local ]; then
    source $zshrc_local
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
