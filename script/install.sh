#!/bin/bash

error () {
	if [ -n "$1" ]
	then
		printf "error: $1"
		printf "\n"
	fi
	printf "usage: script/install.sh [ \e[4mdirectory\e[00m ]\n"
	exit
}

install () {
	DF_ROOT="`pwd`"
	DF_SOURCE="`find $DF_ROOT -maxdepth 2 -name \*.symlink`"

	if [ -n "$1" ]
	then
		printf "\e[1;32mcreate\e[00m $1\n"
		mkdir $1
	fi

	for source in $DF_SOURCE
	do
		dest="$HOME/.`basename \"${source%.*}\"`"
		if [ -n "$1" ]
		then
			copy="`basename \"$dest\"`"
			cp -r $dest $1/${copy#.}.symlink
		fi

		printf "\e[1;31mremoved\e[00m $dest\n"
		rm -rf $dest
	done

	for source in $DF_SOURCE
	do
		dest="$HOME/.`basename \"${source%.*}\"`"
		printf "\e[1;34mlinked\e[00m `basename \"$source\"`\n"
		ln -s $source $dest
	done
}

if [ $# -gt 1 ]
then
	error "Wrong argument count."
fi

# Overwrite dotfiles if a backup directory is not specified
if [ -z "$1" ]
then
	install
else
	# Throw an error if the backup directory is a file or it already exists
	if [ -f $1 ] || [ -d $1 ]
	then
		error "Directory already exists!"
	else
		install $1
	fi
fi

