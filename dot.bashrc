# Philip Pesca

if [[ -f "$(dirname $(readlink $HOME/.bashrc))/backup/dot.bashrc" ]]; then
    source "$(dirname $(readlink $HOME/.bashrc))/backup/dot.bashrc"
fi

if [[ -f /etc/bash_completion ]]; then
    source /etc/bash_completion
fi

PS1="\n\[\e[1m\]\u@\h:\[\e[0;34m\]\w\[\e[0m\]\[\e[1m\]\\$\[\e[0m\] "

export EDITOR=vim
export HISTCONTROL=ignoredups

alias ll='ls -lF --color=auto'
alias la='ls -alF --color=auto'
alias ls='ls -F --color=auto'

alias grep='grep --color=auto'

