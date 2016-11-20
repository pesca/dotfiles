# dotfiles

My personal configuration files. To install, run
`script/install.py` which will overwrite existing configuration files.

Vim plugins are git submodules. We have to initialize them from the
same git working directory to install them:

    $ git submodule update --init --recursive

