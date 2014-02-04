alias df='df -h' # humanize sizes
alias cp='cp -i' # confirm before overwrite
alias hi='history | tail -20'
alias reload!='. ~/.bash_profile'
alias localip='ipconfig getifaddr en1'
alias psg='ps aux | grep $1'
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to clipboard.'"

alias l='ls -laGFh'
alias ..='cd ..'
alias ...='cd ../..'

alias r='ruby'

alias gst='git status'
alias gco='git checkout'
alias gd='git diff'
alias gb='git branch'
alias gs='git show'

alias rs='rails s'
alias rc='rails c'
alias tlog='tail -f log/development.log'

alias gemi='gem install --no-ri --no-rdoc'
alias gemu='gem uninstall'

alias b='bundle'
alias be='bundle exec'
alias bi='bundle install'
alias bu='bundle update'

alias jks='jekyll server -w'
alias jkb='jekyll build'