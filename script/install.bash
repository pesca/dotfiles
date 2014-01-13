DOTFILES_ROOT="`pwd`"

link_files () {
	ln -s $1 $2
	printf "linked `basename \"$1\"` to ~/`basename \"$2\"`\n"
} 

for source in `find $DOTFILES_ROOT -maxdepth 2 -name \*.symlink`
do
	dest="$HOME/.`basename \"${source%.*}\"`"

	if [ -f $dest ] || [ -d $dest ]
	then
		rm -rf $dest
		printf "removed $dest\n"
	fi

	link_files $source $dest
done
