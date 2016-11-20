# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# alias foo="ctags -R . $(bundle list --paths)

if [ "`uname`" == "Darwin" ] && [ $TERM_PROGRAM == "Apple_Terminal" ]
then
        if [ -e "/Applications/MacVim.app/Contents/MacOS/Vim" ]
        then
                alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
                alias mvim="vim -g"
        fi

        alias ls="ls -GF"
elif [ "`uname`" == "Linux" ]
then
        alias ls="ls --color=always"
fi

