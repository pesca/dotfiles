#!/usr/bin/python

import os
import sys
import glob
import shutil


def install():
    base_dir = os.path.abspath(os.path.dirname(__file__))
    base_dir = os.path.dirname(base_dir)
    home_dir = os.path.expanduser('~')
    sources = glob.glob(base_dir + "/*/*.symlink")

    i = 0
    while os.path.isdir(home_dir + "/dotfiles_backup_" + str(i)):
        i = i + 1
    backup_dir = home_dir + "/dotfiles_backup_" + str(i)
    os.mkdir(backup_dir)
    
    for source in sources:
        source = os.path.splitext(source)[0]
        source = os.path.basename(source)
        dest = home_dir + "/." + source

        if os.path.isfile(dest) or os.path.isdir(dest) or os.path.islink(dest):
            os.rename(dest, backup_dir + "/" + source)
            print "moved {0} to {1}".format(dest, backup_dir)

    for source in sources:
        dest = home_dir + "/." + os.path.basename(os.path.splitext(source)[0])
        os.symlink(source, dest)

        print "linked {0}".format(source)

install()

