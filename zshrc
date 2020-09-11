export TERM='xterm-256color'
#https://github.com/Powerlevel9k/powerlevel9k/wiki/Install-Instructions#option-4-install-nerd-fonts
#https://github.com/Powerlevel9k/powerlevel9k/wiki/Show-Off-Your-Config
#https://github.com/sevenfoxes/dotfiles/
#https://github.com/ryanoasis/nerd-fonts
#https://github.com/zsh-users/antigen
source /usr/local/share/antigen/antigen.zsh
source ~/.dotfiles/.theme
antigen use oh-my-zsh
antigen bundle StackExchange/blackbox
antigen bundle brew
antigen bundle command-not-found
antigen bundle common-aliases
antigen bundle docker
antigen bundle docker-compose
antigen bundle git
antigen bundle golang
antigen bundle npm
antigen bundle nvm
antigen bundle python
antigen bundle tmux
antigen theme bhilburn/powerlevel9k powerlevel9k
antigen apply

export TERM='xterm-256color'
export NCURSES_NO_UTF8_ACS=1
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=vim

setopt histignorealldups share_history prompt_subst
unsetopt auto_name_dirs
autoload -Uz compinit
fpath+=~/.zfunc
compinit
bindkey -e

# Allow Ctrl-s in vim
stty -ixon

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
#Prompt color and model
PROMPT="%F{240}\$(repeat \$COLUMNS printf '·')%f"
PROMPT+='%B%F{green}%n%F{green}:%F{blue}%(3~|…|)%2~%F{green} *-> %b%f'

unsetopt auto_name_dirs


#Java export /Library/Java/JavaVirtualMachines/
#export JAVA_HOME=$(/usr/libexec/java_home -v 11)
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
#export PATH=$JAVA_HOME/bin:$PATH

#Terminal Color
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

# Load tmux at the beginning
if [ "$TMUX" = "" ]; then tmux; fi

#Go
#export GOPATH=$HOME/go-workspace # don't forget to change your path correctly!
#export GOROOT=/usr/local/opt/go/libexec
#export PATH=$PATH:$GOPATH/bin
#export PATH=$PATH:$GOROOT/bin
#export PATH="/usr/local/sbin:$PATH"

#Aliases

#Git
alias gp='git pull'
alias gpr='git pull --rebase'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias ga='git add'
alias gst='git status'
alias gpu='git push'
alias glog='git log'
alias gshow='git show'

#Kubectl alias
alias k='kubectl'
alias kcv='kubectl config view'
alias kcc='kubectl config use-context'

#direnv configuration - install brew direnv
eval "$(direnv hook zsh)"

#brew install zsh-autosuggestions
#source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-autosuggestion/zsh-autosuggestions.zsh

#brew tap sambadevi/powerlevel9k
#brew install powerlevel9ksource /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme
#source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme
#source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme


#Set Python 3 as default
#Install
#brew install pyenv 
#pyenv install 3.7.3
#pyenv global 3.7.3
#
#echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
#brew install python =>3
#brew install python@2 =>2
if [ usr/local/bin/python3 ];
then
  alias python='python3'
  alias pip='pip3'
fi

#brew install fzf 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


#kubectl autocomplate

#Temporal Kubeconfig
#export KUBECONFIG=/Users/rvallejo/.kube/config:/Users/rvallejo/.kube/config.sandbox:/Users/rvallejo/.kube/config.qa:/Users/rvallejo/.kube/config.preview:/Users/rvallejo/.kube/config.mapi:/Users/rvallejo/.kube/config.nonprod

#https://krew.sigs.k8s.io/docs/user-guide/setup/install/
#export PATH="${PATH}:${HOME}/.krew/bin"

alias sc='history | fzf +s --tac'
alias fd=fdfind
alias find='find . -type f | fzf'
alias grep='grep --color=auto'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source <(kubectl completion zsh)
alias k=kubectl
complete -F __start_kubectl k

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
