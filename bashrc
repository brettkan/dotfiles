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
alias go='git checkout '
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

alias hack='cd /Users/brettkan/Dropbox/Hack_Reactor'
alias algs='cd /Users/brettkan/Dropbox/Hack_Reactor/algorithms'
alias toy='cd /Users/brettkan/Dropbox/Hack_Reactor/2015-05-toy-problems'
alias self='cd /Users/brettkan/Dropbox/Hack_Reactor/projects/fantasyFootballDrafter'
alias green='cd /Users/brettkan/Dropbox/Hack_Reactor/projects/HowWasIt'
alias legacy='cd /Users/brettkan/Dropbox/Hack_Reactor/projects/MuniButler-Mobile'
alias thesis='cd /Users/brettkan/Dropbox/Hack_Reactor/projects/Portalize'
alias scripts='cd /Users/brettkan/Documents/scripts'

### Lyft Onebox
CURBOX="bkan"
alias ob='ssh $CURBOX-onebox.dev.ln -t "onebox_env"'
alias sshwww2='ssh www2-legacy-$CURBOX-onebox.dev.ln'
alias sshtom='ssh tom-legacy-$CURBOX-onebox.dev.ln'
alias sshgroundcontrol='ssh groundcontrol-legacy-$CURBOX-onebox.dev.ln'
alias www2ob='ssh www2-legacy-$CURBOX-onebox.dev.ln -t "sudo sh /srv/service/current/devboxify.sh"'
alias tomob='ssh tom-legacy-$CURBOX-onebox.dev.ln -t "sudo sh /srv/service/current/devboxify.sh"'
alias groundcontrolob='ssh groundcontrol-legacy-$CURBOX-onebox.dev.ln -t "sudo sh /srv/service/current/devboxify.sh"'
alias syncwww2='~/src/hacktools/sync-to-onebox-v3.sh www2-legacy-$CURBOX'
alias synctom='~/src/hacktools/sync-to-onebox-v3.sh tom-legacy-$CURBOX'
alias tom='cd ~/src/tom'
alias www2='cd ~/src/lyft.com'
alias adb='/Users/bkan/Library/Android/sdk/platform-tools/adb'
sync () {
    ~/src/hacktools/sync-to-onebox-v3.sh $1-legacy-$CURBOX
}
synchost () {
    ~/src/hacktools/sync-to-onebox-v3.sh $1-legacy-$2 --location host
}
y () {
    ~/src/hacktools/sync-to-onebox-v3.sh $1-legacy-$CURBOX
}
sshl () {
    ssh $1-legacy-$CURBOX-onebox.dev.ln -t "cd /srv/service/current; bash"
}
s () {
    ssh $1-legacy-$CURBOX-onebox.dev.ln -t "cd /srv/service/current; bash"
}
tailf () {
    ssh $1-legacy-$CURBOX-onebox.dev.ln -t "tail -f /var/log/$1-web/current"
}
tailegress () {
    ssh $1-legacy-$CURBOX-onebox.dev.ln -t "tail -f /var/log/envoy/egress_http.log"
}
tailingress () {
    ssh $1-legacy-$CURBOX-onebox.dev.ln -t "tail -f /var/log/envoy/ingress_http.log"
}
sshob () {
    ssh $1-onebox.dev.ln -t "onebox_env"
}
sshlob () {
    ssh $1-legacy-$2-onebox.dev.ln -t "cd /srv/service/current; bash"
}
syncob () {
    ~/src/hacktools/sync-to-onebox-v3.sh $1-legacy-$2
}
tailfob () {
    ssh $1-legacy-$2-onebox.dev.ln -t "tail -f /var/log/$1-web/current"
}
testgreen () {
    ssh green-legacy-$CURBOX-onebox.dev.ln -t "cd /srv/service/current; sudo service_venv py.test tests/unit/"
}
lintgreen () {
    ssh green-legacy-$CURBOX-onebox.dev.ln -t "cd /srv/service/current; sudo service_venv flake8"
}
reado () {
    ssh readonlydb.ln -t "rom $1 shell"
}

### Testing

# full suite of JS tests (without linting)
# service_venv ./manage.py test karma

# full suite of JS tests
# service_venv ./manage.py test js

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

# Update onebox with new dependencies / requirements
# sudo salt-call state.highstate

# Update python packages
# sudo service_venv pip install -r requirements.txt

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
PATH=$PATH:/Users/bkan/.lyftkube-bin
