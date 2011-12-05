LS_COLORS="no=36:fi=36:di=01;37:ln=01;35:pi=33:so=01;34:bd=01;33:cd=01;33:or=01;31:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jpg=01;35:*.png=01;35:*.gif=01;35:*.bmp=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.png=01;35:*.mpg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:"
export PS1="\u:\w$ "
export PATH=/opt/local/bin:/opt/local/sbin:/opt/local/bin/ruby:/usr/local/bin:/Applications/MAMP/Library/bin:$PATH
export MANPATH=$MANPATH:/opt/local/share/man
export INFOPATH=$INFOPATH:/opt/local/share/info
export LC_CTYPE=en_US.UTF-8
export SVN_EDITOR=emacs

# To start
alias start='cache;'

# Finder
alias b="cd /Users/olivier/Documents/Boulot/"
alias chu="cd /Users/olivier/Documents/Boulot/chugsvn"
alias chug="cd /Users/olivier/Documents/Boulot/chugit"
alias bt="cd /Users/olivier/Documents/Boulot/chugit/Blindtest"
alias ..='cd ..'

# Term
alias e='exit'
alias l='ls -laGh'
alias ll='ls -laG'

# Ruby
alias srv='ruby script/server'
alias psrv='RAILS_ENV=production ruby script/server'
alias rsrv='ruby script/rails server'
alias prsrv='RAILS_ENV=production ruby script/rails server'
alias cle='ruby script/console'
alias rcle='ruby script/rails console'
alias rst='touch tmp/restart.txt'
alias be='bundle exec'

# Cache
alias cache='/opt/local/bin/memcached -d -m 24 -p 11211'

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

# Rvm
alias playboy="rvm use 1.9.2-p180@playboy"
alias meetings="rvm use 1.9.2-p180@meetings"

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

export PS1="$BLUE[$RED\w$GREEN\$(parse_git_branch)\$(parse_svn_branch)$BLUE]\$$BLACK "

EVENT_NOKQUEUE=yes
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.