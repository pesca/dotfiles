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
    
    for source in sources:
        source = os.path.splitext(source)[0]
        source = os.path.basename(source)
        dest = home_dir + "/." + source

        if os.path.isfile(dest) or os.path.islink(dest):
            os.remove(dest)
        elif os.path.isdir(dest):
            shutil.rmtree(dest)

        print "removed {}".format(dest)

    for source in sources:
        dest = home_dir + "/." + os.path.basename(os.path.splitext(source)[0])
        os.symlink(source, dest)

        print "linked {}".format(source)


install()

