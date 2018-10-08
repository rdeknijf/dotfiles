export ZSH=$HOME/.oh-my-zsh

export WORKON_HOME=$HOME/.virtualenvs

ZSH_THEME="ys"

bindkey '^[[C' forward-word
bindkey '^[[D' backward-word
bindkey '^H' backward-kill-word

alias sagu1="sudo apt-get update"
alias sagu2="sudo apt-get upgrade"
alias sagu3="sudo apt-get dist-upgrade"
alias sagu4="sudo apt-get update && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y"
alias pua="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U"
alias svh="sudo vim /etc/hosts"
#alias srx="ssh -t $(xclip -out -selection clipboard) 'sudo su -'"
alias ansible-this='ansible-playbook ~/Dropbox/Cloud/ansible/$(hostname | tr "[:upper:]" "[:lower:]").yml'
alias ansible-all='ansible-playbook ~/Dropbox/Cloud/ansible/all.yml'
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
alias "vagrant-rebuild"='vagrant destroy -f; vagrant up'
alias "ssh-add-wd"='ssh-add ~/.ssh/id_rsa ~/.ssh/id_rsa_dragon'
alias "ansible-galaxy-update"="rm -rf ./deploy/ansible/roles-vendor; ansible-galaxy install -r ./deploy/ansible/requirements.yml"
alias krja='kubectl exec $(kubectl get pods --field-selector status.phase==Running --output jsonpath="{.items[0].metadata.name}" --selector jenkins=slave -n default) -n default -it /bin/bash'

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

export DISABLE_VENV_CD=1
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git virtualenvwrapper pip npm composer command-not-found vagrant ubuntu tmux extract dirpersist history docker redis-cli python colorizei ssh-agent aws terraform kubectl)

zstyle :omz:plugins:ssh-agent agent-forwarding on

source $ZSH/oh-my-zsh.sh
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

if [[ ! $TERM =~ screen ]]; then
    exec tmux
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ $commands[minikube] ]; then
  source <(minikube completion zsh)
fi

[ -f ~/.path ] && source ~/.path
