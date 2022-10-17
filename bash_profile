if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash

# MISC
source '/Users/bkan/src/awsaccess/awsaccess2.sh' # awsaccess
source '/Users/bkan/src/awsaccess/oktaawsaccess.sh' # oktaawsaccess
