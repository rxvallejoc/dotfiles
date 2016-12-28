export TERM='xterm-256color'
export NCURSES_NO_UTF8_ACS=1
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

ZSH=$HOME/.oh-my-zsh
ZSH_THEME='robbyrussell'
#ZSH_THEME='agnoster'
CASE_SENSITIVE=true
COMPLETION_WAITING_DOTS=true

plugins=(git gradle vagrant tmux)

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=false

. $ZSH/oh-my-zsh.sh

if [[ $(uname) == 'Linux' ]] ; then
  export LINUX=1
else
  export OSX=1
fi

export PATH=$PATH:$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
export PATH=/usr/local/heroku/bin:$PATH
[[ $OSX == '1' ]] && export PATH=/usr/local/bin:$PATH
[[ $OSX == '1' ]] && export PATH=/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH
export ANT_ARGS='-logger org.apache.tools.ant.listener.AnsiColorLogger'
export EDITOR=vim

unsetopt auto_name_dirs
alias please='sudo'
alias gs='git status'
compdef _git gs=git-status
alias glr='git pull --rebase'
compdef _git glr=git-pull
alias gsinit='git submodule update --init --recursive'
alias gspull='git submodule foreach git pull origin master'

# Waiting for this PR to be merged: https://github.com/robbyrussell/oh-my-zsh/pull/3661
_gradlew_tasks () {
  if [ in_gradle ]; then
    _gradle_arguments
    if _gradle_does_task_list_need_generating; then
     ./gradlew tasks --all | grep "^[ ]*[a-zA-Z0-9]*\ -\ " | sed "s/ - .*$//" | sed "s/[\ ]*//" > .gradletasknamecache
    fi
    compadd -X "==== Gradlew Tasks ====" `cat .gradletasknamecache`
  fi
}

alias gw='./gradlew'
compdef _gradlew_tasks gw

[[ $OSX == '1' ]] && alias o='open'
[[ $LINUX == '1' ]] && alias o='xdg-open'

# Allow Ctrl-s in vim
stty -ixon

#export _Z_DATA=$HOME/.z/z-data
#[[ -s $HOME/.z/z.sh ]] && . $HOME/.z/z.sh

#[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

#[[ -s /usr/local/bin/virtualenvwrapper.sh ]] && . /usr/local/bin/virtualenvwrapper.sh

#export PATH=$PATH:$HOME/.rvm/bin
#[[ -s $HOME/.rvm/scripts/rvm ]] && . $HOME/.rvm/scripts/rvm


 #[ -r "$HOME/.smartcd_config" ] && ( [ -n $BASH_VERSION ] || [ -n $ZSH_VERSION ] ) && source ~/.smartcd_config
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_05.jdk/Contents/Home/
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk/
#export JAVA_HOME=/opt/jdk1.7.0_79/
export PATH=$JAVA_HOME/bin:$PATH

# [[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"

#export DOCKER_HOST=tcp://192.168.59.103:2376
#export DOCKER_CERT_PATH=/Users/rvallejo/.boot2docker/certs/boot2docker-vm
#export DOCKER_TLS_VERIFY=1
export VAGRANT_DEFAULT_PROVIDER=virtualbox
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
export SONAR_TOKEN=1778599a4bac7864a081bd28259eebe30d2b7107
