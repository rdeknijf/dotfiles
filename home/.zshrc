# exports
export ZSH=$HOME/.oh-my-zsh
export WORKON_HOME=$HOME/.virtualenvs
export DISABLE_VENV_CD=1

# theme
ZSH_THEME="ys"

# fix ctrl-arrows
bindkey '^[[C' forward-word
bindkey '^[[D' backward-word
bindkey '^H' backward-kill-word

# display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# history output timestamp format
HIST_STAMPS="yyyy-mm-dd"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git virtualenvwrapper pip npm composer command-not-found vagrant ubuntu tmux extract dirpersist history docker redis-cli python colorizei ssh-agent aws terraform kubectl helm systemd web-search ansible fzf fzf-zsh)

zstyle :omz:plugins:ssh-agent agent-forwarding on

source $ZSH/oh-my-zsh.sh
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

if [[ ! $TERM =~ screen ]]; then
    exec tmux
fi

if [ $commands[minikube] ]; then
  source <(minikube completion zsh)
fi

RPROMPT='%{$fg[blue]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'

[ -f ~/.alias ] && source ~/.alias
[ -f ~/.path ] && source ~/.path
