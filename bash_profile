# load aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# load git completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# rbenv
export PATH="$HOME/.rbenv/bin:/usr/local/bin:$PATH"
eval "$(rbenv init -)"

# ruby version via rbenv
function ruby_version {
  rbenv version-name
}

# load git prompt
source ~/.git-prompt.sh

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
export PS1="$GREEN\$(ruby_version)$RESET \u: \w$CYAN\$(__git_ps1)$RED\$(git_dirty)$RESET\$ "