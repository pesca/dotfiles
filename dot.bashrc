# ~/.bashrc is executed by non-login shells (e.g. new terminal window). 

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
EDITOR=vim

shopt -s histappend
shopt -s checkwinsize

if [[ -f /etc/bash_completion ]]; then
    . /etc/bash_completion
fi

PS1="\[\e[1m\]\u@\h:\[\e[0;34m\]\W\[\e[0m\]\[\e[1m\]\\$\[\e[0m\] "

if [[ $(uname) = 'Darwin' ]]; then
    alias ll='ls -lFG'
    alias la='ls -alFG'
    alias ls='ls -FG'
elif [[ $(uname) = 'Linux' ]]; then
    alias ll='ls -lF --color=auto'
    alias la='ls -alF --color=auto'
    alias ls='ls -F --color=auto'
 
    which xdg-open &> /dev/null && alias open='xdg-open'
    unset SSH_ASKPASS
fi

alias grep='grep --color=auto'
alias bc='bc -l'
