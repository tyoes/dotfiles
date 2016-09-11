# .bashrc
export PROMPT_DIRTRIM=2
case $TERM in
    xterm*)
        PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD##*/}"'
	      PS1="\[\`if [[ \$? = "0" ]]; then echo '\e[32m\u@\h\e[0m'; else echo '\e[31m\u@\h\e[0m' ; fi\`:\w\n\$ "
        ;;
esac

# improved history
export HISTFILESIZE=50000
export HISTSIZE=10000
shopt -s histappend
shopt -s cmdhist # combine multiline commands
HISTCONTROL=ignoredups # ignore duplicates
export HISTIGNORE="&:ls:[bf]g:exit" # ignore 'ls' and builtins

# source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# source .bashrc_private
if [ -f $HOME/.bashrc_private ]; then
    . $HOME/.bashrc_private
fi

# user-specific aliases and functions
alias sl='ls'
alias sls='ls'
alias ll='ls -laF'
alias vi='vim'
alias ci='vim'
alias bi='vim'
alias wget='curl -O'
alias work='cd $WORKSPACE'
alias down='cd $HOME/Downloads'
alias temp='cd $HOME/temp'
alias mykey='cat $HOME/.ssh/id_rsa.pub'
alias looptrue='sudo losetup -f /hdd/storage/truecrypt_storage'
alias sublime='/opt/sublime_text/sublime_text %F'

# conditional alias for adding id_rsa to agent
ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add $HOME/.ssh/id_rsa && unalias ssh; ssh'

# user-specific local db aliases
alias sudo='sudo '
alias startldap='systemctl start slapd.service'
alias startsql='sudo service mysqld start'
alias startpostgres='sudo systemctl start postgresql'
alias startmongo='mongod --bind_ip localhost --dbpath "$HOME/devtools/mongodb/" --nojournal --noprealloc --nohttpinterface'
alias repairmongo='mongod --bind_ip localhost --dbpath "$HOME/devtools/mongodb/" --nojournal --noprealloc --nohttpinterface --repair'

# The next line updates PATH for the Google Cloud SDK.
source '$HOME/devtools/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '$HOME/devtools/google-cloud-sdk/completion.bash.inc'

# The next line enables bash completion for gcloud.
source '$HOME/devtools/google-cloud-sdk/completion.bash.inc'

# Necessary for the grpc node_module to run
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib
