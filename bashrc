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

# Git revert last few.  Pass in commit that you want to change back to.
eject() {
    git revert --no-commit $1..HEAD
}

# Github scripts

hubc() {
    local reponame=$(basename -s .git `git config --get remote.origin.url`)
    local branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
    local url="https://github.com/lyft/${reponame}/compare/${branch}"
    python -mwebbrowser $url
}

hubpr() {
    local reponame=$(basename -s .git `git config --get remote.origin.url`)
    local branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
    local url="https://github.com/lyft/${reponame}/compare/${branch}?expand=1"
    python -mwebbrowser $url
}

### npm
alias npmAll='npm list -g --depth=0'
source /usr/local/etc/bash_completion.d/npm
source '/Users/bkan/.sh/custom/npm-logout.sh'

### homebrew
alias brewAll='brew list --versions'

### Directory commands
alias dotfiles='cd ~/dotfiles'
alias openhosts='subl /Users/bkan/.ssh/known_hosts'

### Lyft Commands
alias src='cd ~/src'
alias srcg='cd $GOPATH/src/github.com/lyft'
reado () {
    ssh readonlydb.ln -t "rom $1 shell"
}
lssh () {
    lyftkube ssh $1
}
lscp () {
    # SCP a file to a particular docker pod
    # $1 - pod name (e.g. core-prod-4/green-spin-56766849dd-8vppk )
    # $2 - path to the file or directory to copy (e.g. ~/Downloads/wav_add.csv )
    local IN=$1
    local PODARR=(${IN//\// })
    local CLUSTER=${PODARR[0]}
    local CLUSTERARR=(${CLUSTER//-/ })
    local PODID=${PODARR[1]}
    local PODIDARR=(${PODID//-/ })
    local SERVICE=${PODIDARR[0]}

    local ENVFLAG="production"
    if [ ${CLUSTERARR[1]} = "staging" ]
    then
        local ENVFLAG="staging"
    fi

    local IN2=$2
    local PATHARR=(${IN2//\// })
    local FILENAME=${PATHARR[${#PATHARR[@]}-1]}

    local COMMAND="lyftkube -e ${ENVFLAG} --cluster ${CLUSTER} kubectl cp ${IN2} ${SERVICE}-${ENVFLAG}/${PODID}://tmp/home/${FILENAME}"
    echo $COMMAND
    eval $COMMAND
}
lpod () {
    local ENV="production"
    if [ $# -eq 2 ]
    then
        local ENV="staging"
    fi

    local COMMAND="lyftkube get pods -p $1 -e $ENV"
    echo $COMMAND
    eval $COMMAND
}
alias runpiptools='~/src/hacktools/run-piptools'

# install aactivator
eval "$(/opt/lyft/brew/bin/aactivator init)"
# blessclient
source '/Users/bkan/src/blessclient/lyftprofile'
# AWS Access
source '/Users/bkan/src/awsaccess/awsaccess2.sh' # awsaccess
source '/Users/bkan/src/awsaccess/oktaawsaccess.sh' # oktaawsaccess
export PS1="\$(ps1_mfa_context)$PS1" # awsaccess
# lyft venv path
export PATH="$PATH:${HOME}/bin"

### Ghost blog
alias ghost='ssh root@104.236.130.89'


### Base 64 Decode
b64() {
    echo $2 | base64 -D | python -mjson.tool
}

### Pretty Print JSON
pretty() {
    echo
    echo $1 | python -mjson.tool
}

### pyenv config
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
fi

## pyenv / xcode fix
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

### Misc
PATH=$PATH:/Users/bkan/.lyftkube-bin
