# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export WORKON_HOME=$HOME/.virtualenvs
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"

ZSH_THEME="ys"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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
alias "ssh-add-wd"="ssh-add ~/.ssh/id_rsa ~/.ssh/id_rsa_dragon"
alias "ansible-galaxy-update"="rm -rf ./deploy/ansible/roles-vendor; ansible-galaxy install -r ./deploy/ansible/requirements.yml"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git virtualenvwrapper pip npm composer command-not-found vagrant ubuntu tmux extract dirpersist history docker redis-cli python colorizei ssh-agent)

zstyle :omz:plugins:ssh-agent agent-forwarding on

source $ZSH/oh-my-zsh.sh
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#if [ -z "$SSH_AUTH_SOCK" ] ; then
#  eval `ssh-agent -s`
#  ssh-add
#fi

if [[ ! $TERM =~ screen ]]; then
    exec tmux
fi

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/opt/terraform"
export PATH="$PATH:/opt/sonar-scanner/bin"
