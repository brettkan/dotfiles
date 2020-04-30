if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH
source '/Users/bkan/src/awsaccess/awsaccess2.sh' # awsaccess
source '/Users/bkan/src/awsaccess/oktaawsaccess.sh' # oktaawsaccess
export PS1="\$(ps1_mfa_context)$PS1" # awsaccess
