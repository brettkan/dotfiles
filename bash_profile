if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash
source '/Users/bkan/src/blessclient/lyftprofile' # bless ssh alias
