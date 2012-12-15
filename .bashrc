alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias l='ls -la'
alias ..='cd ..'

alias gemi='gem install --no-ri --no-rdoc'
alias gemu='gem uninstall'

alias slt='sublime-text-2'

alias gst='git status'
alias gco='git checkout'
alias gd='git diff'
alias gb='git branch'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

function rvm_version {
  local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
  [ "$gemset" != "" ] && gemset="$gemset"
  local version=$(echo $MY_RUBY_HOME | awk -F'rubies/' '{print $2}')
  [ "$version" != "" ] && version="$version@"
  local full="$version$gemset"
  [ "$full" != "" ] && echo "$full "
}

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

export PS1="\$$GREEN\$(rvm_version)$NO_COLOUR\u@machine$NO_COLOUR:\w$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "
