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

# location env variables
export DEVTOOLS="$HOME/devtools"
export WORKSPACE="$HOME/workspace"

# language env variables
export GOROOT="/usr/local/go"
export GOPATH="$WORKSPACE/gopath"
export GOARCH=amd64
export GOOS=linux
export CGO_ENABLED=1
export JAVA_HOME="/usr/lib/jvm/jdk"

export PATH=$JAVA_HOME/$GOROOT/bin:$GOPATH/bin:$DEVTOOLS/mongodb/bin:$HOME/.rbenv/bin:$PATH

# user-specific aliases and functions
alias ls='ls -laF'
alias sl='ls -laF'
alias sls='ls -laF'
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
alias startmongo='mongod --bind_ip localhost --dbpath "$DEVTOOLS/mongodb/" --nojournal --noprealloc --nohttpinterface'
alias repairmongo='mongod --bind_ip localhost --dbpath "$DEVTOOLS/mongodb/" --nojournal --noprealloc --nohttpinterface --repair'