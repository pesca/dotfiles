# My dotfiles

My personal configuration files.

## Install

	git clone https://github.com/pesca/dotfiles
	cd dotfiles
	git submodule update --init --recursive
	script/install.sh

To prevent overwriting preexisting dotfiles, you can specify a directory to
backup to.

	script/install.sh path/to/dotfiles/backup
	
