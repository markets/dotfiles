function ruby_version {
  rbenv version-name
}

function rails_version {
  rails -v | sed 's/Rails //'
}

function git_dirty {
  local status=$(git status --porcelain 2> /dev/null)

  if [[ "$status" != "" ]]; then
    echo '* '
  else
    echo ''
  fi
}

function mkcd {
  dir=$1;
  mkdir -p $dir && cd $dir;
}
