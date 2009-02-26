# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=2000
setopt appendhistory autocd nomatch extendedglob
unsetopt beep notify
bindkey -e
# End of lines configured by zsh-newuser-install

# Add user-supplied programs to our environment
if [[ -d $HOME/bin ]] ; then
  typeset -U path
  export path = ($path $HOME/bin)
fi
if [[ -d $HOME/sr/coroner ]] ; then
  typeset -U path
  export path = ($PATH $HOME/sr/coroner)
fi
if [[ -d $HOME/man  ]] ; then
  typeset -U manpath
  export manpath = ($manpath $HOME/man)
fi

# Perforce setup
export P4PORT=p4proxy.waterloo.bluecoat.com:1666
export P4USER=gaelan.dcosta

## Universal Truths about our Bluecoat Dev environment ##
export QUIETBLD=1
export CL_OBJTYPE=release_ca
export PRODUCTS=cf_2xx.bind

# Almost a universal truth -- platform dependant
if [[ $(uname -o) == "Cygwin" ]] ; then
  export PERL_HOME=c:/Perl/bin
else
  export PERL_HOME=/usr/bin
fi


#Workflow aliases and functions
cgrep () {
	find . -iname '*.[ch]' -or -iname '*.[ch]pp' -print0 | xargs -0 grep -n $1
}
hgrep () { 
	find . -iname '*.h' -or -iname '*.hpp' -print0 | xargs -0 grep -n $1
}
jgrep () {
	find . -iname '*.java' -print0 | xargs -0 grep -n $1
}

#alias 2xx_install='cd bgm && make && cd .. && cp wdir/2xx.CHK_dbg /cygdrive/c/Inetpub/wwwroot'

#Mundane aliases
alias ls='ls --color=auto -Fh'
alias grep='grep --color'