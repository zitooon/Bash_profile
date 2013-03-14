if [[ -s /Users/olivier/.bashrc ]] ; then source /Users/olivier/.bashrc ; fi

LS_COLORS="no=36:fi=36:di=01;37:ln=01;35:pi=33:so=01;34:bd=01;33:cd=01;33:or=01;31:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jpg=01;35:*.png=01;35:*.gif=01;35:*.\
bmp=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.png=01;35:*.mpg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:"
export PS1="\u:\w$ "
export PATH=/opt/mongodb-osx-x86_64-2.0.2/bin:/opt/redis-2.4.6/src:/opt/apache-cassandra-1.0.7/bin:/opt/PostgreSQL/9.1/bin/:/usr/local/bin:/Applications/MAMP/Library/bin:$PATH
export MANPATH=$MANPATH:/opt/local/share/man
export INFOPATH=$INFOPATH:/opt/local/share/info
export LC_CTYPE=en_US.UTF-8
export SVN_EDITOR=emacs
# export CC='/usr/bin/gcc-4.2'

alias ebp='emacs ~/.bash_profile'

# To start
alias start=''

# Finder
alias b="cd /Users/olivier/Documents/Boulot/"
alias ..='cd ..'
alias a='alias'
# alias c='cd /Users/olivier/Documents/Boulot/VideoAgency/git/YouLearn'
alias c='cd /Users/olivier/Documents/Boulot/VideoAgency/git/copyrightly'

# Term
alias e='exit'
alias l='ls -lahG'
alias ll='ls -laG'
alias h='history'
alias s='source ~/.bash_profile;echo "Source bash profile done"'

# Rvm
alias r='rvm'
alias rl='rvm list'
alias rg='rvm gemset'
alias ru='rvm use'

# Ruby
alias srv='ruby script/server'
alias rsrv='ruby script/rails server'
alias cle='ruby script/console'
alias rcle='ruby script/rails console'
alias rst='touch tmp/restart.txt'
alias be='bundle exec'

alias rbp="bundle exec rails_best_practices ."
alias annotate="bundle exec annotate -e tests,fixtures"

# Fake_dynamo
alias fd="fake_dynamo --port 1234"

# Faye
alias faye="bundle exec rackup faye.ru -s thin -E production"

# Cache
alias cache='/usr/bin/memcached -d -m 24 -p 11211'

# SVN
alias ci='svn ci -m'
alias up='svn up'
alias st='svn st'
alias ut='svn up;svn st'
alias svnaa='svn st | grep "^\?" | awk "{print \$2}" | xargs svn add $1'
alias svnda='svn st | grep "^\!" | awk "{print \$2}" | xargs svn rm $1'

# Git
alias gpu='git pull origin'
alias gpo='git push origin'
alias gci='git commit -am'
alias gt='git status'
alias gc='git checkout'
alias gm='git merge'
alias ga='git add'
alias gb='git branch'
alias gr='git rebase'
alias gca='git commit --amend'
alias gcd='git checkout develop'
alias gcm='git checkout master'
alias gcp='git checkout production'
alias gs='git stash'
alias gsl='git stash list'
alias gsp='git stash pop'
alias gmd='git merge develop'
alias grm='git rebase master'
alias gmm='git merge master'
alias gp='git push'
alias gph='git push heroku'

# Servers
alias redis='redis-server'
alias cas='sudo cassandra -f'
alias casc='cassandra-cli'
alias mon='sudo mongod'

# Node js
alias n='node'
alias nd='node-dev --debug'
alias ni='node-inspector --web-port=8181'

# Express
alias ex='express'

# Elasticsearch
alias elastic='elasticsearch -f -D es.config=/usr/local/opt/elasticsearch/config/elasticsearch.yml'
# To have launchd start elasticsearch at login:
# ln -sfv /usr/local/opt/elasticsearch/*.plist ~/Library/LaunchAgents
# Then to load elasticsearch now:
# launchctl load ~/Library/LaunchAgents/homebrew.mxcl.elasticsearch.plist
# Or, if you don't want/need launchctl, you can just run:
# elasticsearch -f -D es.config=/usr/local/opt/elasticsearch/config/elasticsearch.yml

parse_git_branch () {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(git@\1)/'      
}
parse_svn_branch() {
    parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | egrep -o '(tags|branches)/[^/]+|trunk+|web' | egrep -o '[^/]+$' | awk '{print "(svn@"$1")" }'
}
parse_svn_url() {
    svn info 2>/dev/null | sed -ne 's#^URL: ##p'
}
parse_svn_repository_root() {
    svn info 2>/dev/null | sed -ne 's#^Repository Root: ##p'
}
 
BLACK="\[\033[0;38m\]"
RED="\[\033[0;31m\]"
RED_BOLD="\[\033[01;31m\]"
BLUE="\[\033[01;34m\]"
GREEN="\[\033[0;32m\]"

export PS1="$BLUE[$GREEN\w$RED\$(parse_git_branch)\$(parse_svn_branch)$BLUE]\$$BLACK "

EVENT_NOKQUEUE=yes

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
