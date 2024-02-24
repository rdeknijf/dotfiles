#zmodload zsh/zprof

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}


#exports
export EDITOR=vim
export WORKON_HOME=$HOME/.virtualenvs
export DISABLE_VENV_CD=1
export DIRCOLORS_SOLARIZED_ZSH_THEME="256dark"
export KUBECTX_IGNORE_FZF=1  # tmp fix until https://github.com/junegunn/fzf/issues/1486 is merged
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export DOCKER_BUILDKIT=1
 
# display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# fix ctrl-arrows
bindkey '^[[C' forward-word
bindkey '^[[D' backward-word
bindkey '^H' backward-kill-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa id_ed25519_ewx2

# history
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.zsh_history
HIST_STAMPS="yyyy-mm-dd"

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY

# zplug
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

source ~/.zplug/init.zsh
zplug "zplug/zplug", hook-build:'zplug --self-manage'

#zplug romkatv/powerlevel10k, as:theme, depth:1
zplug "robbyrussell/oh-my-zsh"
zplug "themes/ys", from:oh-my-zsh

zplug "robbyrussell/oh-my-zsh", as:plugin, use:"lib/*.zsh"

zplug "plugins/common-aliases", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/virtualenvwrapper", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/ubuntu", from:oh-my-zsh
zplug "plugins/history", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/dirpersist", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/redis-cli", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/colorize", from:oh-my-zsh
zplug "plugins/ssh-agent", from:oh-my-zsh
zplug "plugins/aws", from:oh-my-zsh
zplug "plugins/terraform", from:oh-my-zsh
zplug "plugins/kubectl", from:oh-my-zsh
zplug "plugins/helm", from:oh-my-zsh
zplug "plugins/systemd", from:oh-my-zsh
zplug "plugins/web-search", from:oh-my-zsh
zplug "plugins/ansible", from:oh-my-zsh
#zplug "plugins/fzf", from:oh-my-zsh
zplug "plugins/zsh-autosuggestions", from:oh-my-zsh
zplug "plugins/fasd", from:oh-my-zsh
#zplug "plugins/npm", from:oh-my-zsh
zplug "plugins/poetry", from:oh-my-zsh

zplug "superbrothers/zsh-kubectl-prompt"
#zplug "ocadaruma/zsh-ghcloud-prompt"
#zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "pinelibg/dircolors-solarized-zsh"
#zplug "wookayin/fzf-fasd"


zplug "lukechilds/zsh-nvm"

# auto-install zplugs
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load


zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes


if [[ ! $TERM =~ screen ]]; then
    exec tmux
fi

# kubectl context prompt
RPROMPT='%{$fg[blue]%}($ZSH_GCLOUD_PROMPT $ZSH_KUBECTL_PROMPT)%{$reset_color%}'

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
eval "$(mcfly init zsh)"

[ -f ~/.alias ] && source ~/.alias
[ -f ~/.path ] && source ~/.path

#export PATH="$HOME/.poetry/bin:$PATH"

#export PYENV_ROOT="$HOME/.pyenv"
#command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

export PATH="$HOME/.poetry/bin:$PATH"

# Created by `pipx` on 2022-12-17 14:47:02
export PATH="$PATH:/home/rdeknijf/.local/bin"

fpath+=~/.zfunc
autoload -Uz compinit && compinit


# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin
#zprof
