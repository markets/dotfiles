# load aliases
source ~/.bash_aliases

# load git completion
source ~/.git-completion.bash

# load git prompt
source ~/.git-prompt.sh

# use .secrets for stuff that you don't want to share in your public, versioned repo.
if [[ -e ~/.secrets ]]; then
  source ~/.secrets
fi

export PATH="$HOME/.rbenv/bin:/usr/local/bin:$PATH"

# rbenv
eval "$(rbenv init -)"

# ruby version via rbenv
function ruby_version {
  rbenv version-name
}

# rails version
function rails_version {
  rails -v | sed 's/Rails //'
}

# git dirty
function git_dirty {
  local status=$(git status --porcelain 2> /dev/null)
  if [[ "$status" != "" ]]; then
    echo '* '
  else
    echo ''
  fi
}

# colors
BLACK='\e[0;30m'
RED='\e[0;31m'
GREEN='\e[0;32m'
YELLOW='\e[0;33m'
BLUE='\e[0;34m'
CYAN='\e[0;36m'
RESET='\e[0m'

# prompt style
export PS1="$YELLOW\$(ruby_version)on$(rails_version)$RESET \u: \w$CYAN\$(__git_ps1)$RED\$(git_dirty)$RESET\$ "