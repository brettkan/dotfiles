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
alias gh='git hist'
alias go='git checkout '

alias gbr='hub browse'
alias gpr='hub pull-request'

alias got='git '
alias get='git '

### CoffeeScript
alias coffeeCompile='coffee --output compiled --map --watch --compile ./'

### npm
alias npmAll='npm list -g --depth=0'
source /usr/local/etc/bash_completion.d/npm

### gulp
# eval "$(gulp --completion=bash)"

### homebrew
alias brewAll='brew list --versions'

### Directory commands
alias dotfiles='cd ~/dotfiles'

alias hack='cd /Users/brettkan/Dropbox/Hack_Reactor'
alias algs='cd /Users/brettkan/Dropbox/Hack_Reactor/algorithms'
alias toy='cd /Users/brettkan/Dropbox/Hack_Reactor/2015-05-toy-problems'
alias self='cd /Users/brettkan/Dropbox/Hack_Reactor/projects/fantasyFootballDrafter'
alias green='cd /Users/brettkan/Dropbox/Hack_Reactor/projects/HowWasIt'
alias legacy='cd /Users/brettkan/Dropbox/Hack_Reactor/projects/MuniButler-Mobile'
alias thesis='cd /Users/brettkan/Dropbox/Hack_Reactor/projects/Portalize'
alias scripts='cd /Users/brettkan/Documents/scripts'

### GoFundMe directory commands
alias gfm='cd ~/gofundme/gofundme'
alias gfmf='cd ~/gofundme/gofundme/funds.gofundme.com'
alias gfmv='cd ~/gofundme/gofundme/funds.gofundme.com/_SERVER_/vagrant'

### GoFundMe Server
alias support01='ssh bkan@50.56.179.49'
alias docker01='ssh bkan@104.130.131.202'

### GFM livetail
alias livetail="cd ~/Dropbox/My\ Projects/Scripts/ && livetail"
alias gfmtail="livetail '_source=php_fpm_logs'"

### Ghost blog
alias ghost='ssh root@104.236.130.89'

export PATH="$PATH:${HOME}/bin"
export PATH="$PATH:${HOME}/.composer/vendor/bin"

### Base 64 Decode
b64() {
    echo ${1:5} | base64 -D | python -mjson.tool
}

b64Watch() {
    #!/bin/bash
    if [ "x$1" != "x" ]; then
       ./urldecode `echo $1 | sed -r 's/^data://'` |base64 -d | python -mjson.tool
    else
       while read line; do
           ./urldecode `echo $line | sed -r 's/^data://'` |base64 -d | python -mjson.tool
       done
    fi
}

### Git revert last few.  Pass in commit that you want to change back to.
eject() {
	git revert --no-commit $1..HEAD
}
