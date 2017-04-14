# Philip Pesca

if [[ -f "$(dirname $(readlink $HOME/.bash_profile))/backup/dot.bash_profile" ]]; then
    source "$(dirname $(readlink $HOME/.bash_profile))/backup/dot.bash_profile"
fi

unset SSH_ASKPASS

source ~/.bashrc

