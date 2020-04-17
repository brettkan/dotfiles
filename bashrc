### Bash commands - Color, show ls multiple in a row
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
alias ls='ls -GFh'

### Bash profile. Use reprof to apply updates.
alias prof="subl ~/.bashrc"
alias reprof=". ~/.bash_profile"

### Show and hide hidden files in finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias show='chflags nohidden'
alias hide='chflags hidden'

### Go config
export GOPATH=~/go
export PATH=$GOPATH/bin:$PATH

### Git commands

# Hub Wrapper
alias git=hub

# Git AutoComplete
source /usr/local/etc/bash_completion.d/git-completion.bash

# Git shortcuts
alias gconfig='subl ~/.gitconfig'

alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gdh='git diff head'
alias gdl='git diff head~'
alias gds='git diff --staged'
gdc () {
    gd $1~ $1
}
alias gh='git hist'
alias gcu='git submodule update'

alias gbr='hub browse'
alias gpr='hub pull-request'

alias got='git '
alias get='git '

# Github scripts

hubc() {
    reponame=$(basename -s .git `git config --get remote.origin.url`)
    branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
    url="https://github.com/lyft/${reponame}/compare/${branch}"
    python -mwebbrowser $url
}

hubpr() {
    reponame=$(basename -s .git `git config --get remote.origin.url`)
    branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
    url="https://github.com/lyft/${reponame}/compare/${branch}?expand=1"
    python -mwebbrowser $url
}

### npm
alias npmAll='npm list -g --depth=0'
source /usr/local/etc/bash_completion.d/npm

### homebrew
alias brewAll='brew list --versions'

### Directory commands
alias dotfiles='cd ~/dotfiles'
alias openhosts='subl /Users/bkan/.ssh/known_hosts'

alias src='cd ~/src'
alias srcg='cd $GOPATH/src/github.com/lyft'

alias hack='cd /Users/brettkan/Dropbox/Hack_Reactor'
alias algs='cd /Users/brettkan/Dropbox/Hack_Reactor/algorithms'
alias toy='cd /Users/brettkan/Dropbox/Hack_Reactor/2015-05-toy-problems'
alias self='cd /Users/brettkan/Dropbox/Hack_Reactor/projects/fantasyFootballDrafter'
alias green='cd /Users/brettkan/Dropbox/Hack_Reactor/projects/HowWasIt'
alias legacy='cd /Users/brettkan/Dropbox/Hack_Reactor/projects/MuniButler-Mobile'
alias thesis='cd /Users/brettkan/Dropbox/Hack_Reactor/projects/Portalize'
alias scripts='cd /Users/brettkan/Documents/scripts'

### Lyft Onebox
sshl () {
    devctl enter $1.legacy
}
sync () {
    cmd="lyfttilt up"
    for var in "$@"
    do
        cmd+=" ${var}.legacy"
    done
    eval $cmd
}
tailf () {
    if [ -z "$2" ]
    then
          devctl logs $1.legacy -f --filepath /var/log/$1-web/current
    else
          devctl logs $1.legacy -f --filepath /var/log/$1-web/current -p $2
    fi
}
reado () {
    ssh readonlydb.ln -t "rom $1 shell"
}
run-piptools () {
    devctl run piptools.compile $1
}
glideup () { # https://github.com/lyft/gotools/tree/master/cmd/gotools-glide-up
    gotools-glide-up github.com/lyft/$1/
}


### lyftenv commands

# install aactivator
eval "$(/lyft/brew/bin/aactivator init)"



### Testing

# full suite of JS tests (without linting)
# sudo service_venv ./manage.py test karma

# full suite of JS tests
# sudo service_venv ./manage.py test js

# Jest Tests
# sudo npm i -g jest-cli  
# jest file.spec.jsx -t "someTest"

# full suite of Python tests
# sudo service_venv ./manage.py test python

# full suite of Python tests with regex
# sudo service_venv ./manage.py test python --only "payouts_test.py"

# Python test one file (fast)
# sudo service_venv py.test test/unit/server/resources/payouts_test.py

# PDB debugger in python
# import pdb; pdb.set_trace()

# JS Test Watch
# sudo grunt watch:jsTest

# Jest in onebox
# npm i -g jest-cli
# jest file.spec.jsx

# Update onebox with new dependencies / requirements
# sudo salt-call state.highstate

# Update python packages
# sudo service_venv pip3 install -r requirements3.txt

# Build and restart wwwpayxpfe
# sudo make build && sudo sv restart wwwpayxpfe-web

# Go To Packages Directory
# /srv/venvs/service/trusty/service_venv_python3.6/lib/python3.6/site-packages/

source '/Users/bkan/src/blessclient/lyftprofile'

### Ghost blog
alias ghost='ssh root@104.236.130.89'

export PATH="$PATH:${HOME}/bin"
export PATH="$PATH:${HOME}/.composer/vendor/bin"

### Base 64 Decode
b64() {
    echo $2 | base64 -D | python -mjson.tool
}

### Pretty Print JSON
pretty() {
    echo
    echo $1 | python -mjson.tool
}

### Git revert last few.  Pass in commit that you want to change back to.
eject() {
	git revert --no-commit $1..HEAD
}

### Lyftkube PATH
PATH=$PATH:/Users/bkan/.lyftkube-bin

### pyenv config
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
