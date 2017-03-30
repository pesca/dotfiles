#!/usr/bin/python3
"""Usage:
  dotfiles.py install [--overwrite --backup=<dir>]
  dotfiles.py update [--skip-bash]

Options:
  -h --help       Shows this screen.
  --overwrite     Overwrite dotfiles.
  --backup=<dir>  Backup dotfiles.
  --skip-bash     Do not update bash dotfiles.
"""
import os, sys, glob, shutil
from docopt import docopt

def update(skip):
    base_path = os.path.abspath(os.path.dirname(__file__))
    home_path = os.path.expanduser('~')

    cwd = os.getcwd()
    os.chdir(base_path)
    sources = glob.glob('*')
    os.chdir(cwd)
        
    sources.remove('README.markdown')
    sources.remove('dotfiles.py')
    if skip:
        sources.remove('bashrc')
        sources.remove('bash_profile')
        sources.remove('profile')
    
    for source in sources:
        dotfile_path = os.path.join(home_path, '.' + source)
        if not os.path.exists(dotfile_path):
            continue
        os.remove(dotfile_path)
        print('removed {}'.format(dotfile_path))

    for source in sources:
        dotfile_path = os.path.join(home_path, '.' + source)
        os.link(os.path.join(base_path, source), dotfile_path)
        print("linked {0} to {1}".format(os.path.join(base_path, source),
            dotfile_path))

def install(overwrite, backup):
    base_path = os.path.abspath(os.path.dirname(__file__))
    home_path = os.path.expanduser('~')

    cwd = os.getcwd()
    os.chdir(base_path)
    sources = glob.glob('*')
    os.chdir(cwd)
        
    sources.remove('README.markdown')
    sources.remove('dotfiles.py')

    backup_path = None
    if backup is not None:
        backup_path = os.path.abspath(backup)
        if not os.path.exists(backup_path):
            os.mkdir(backup_path)
        elif not os.path.isdir(backup_path):
            print("error: backup dir '{}' is not a directory"
                .format(backup))
            sys.exit(1)

    for source in ['bashrc', 'bash_profile', 'profile']:
        dotfile_path = os.path.join(home_path, '.' + source)
        if backup_path is None:
            break
        if os.path.exists(dotfile_path):
            dest_path = os.path.join(backup_path, source)
            shutil.copyfile(dotfile_path, dest_path)
            print('copied {0} to {1}'.format(dotfile_path, dest_path))

    if not overwrite:
        for source in ['bashrc', 'bash_profile', 'profile']:
            dotfile_path = os.path.join(home_path, '.' + source)
            sources.remove(source)
            with open(dotfile_path, 'a') as dotfile:
                source_path = os.path.join(base_path, source)
                dotfile.write('source {}\n'.format(source_path))
                print('appended to {}'.format(dotfile_path))

    for source in sources:
        dotfile_path = os.path.join(home_path, '.' + source)
        if not os.path.exists(dotfile_path):
            continue
        if backup_path is not None:
            os.rename(dotfile_path, os.path.join(backup_path, source))
            print('moved {0} to {1}'.format(dotfile_path,
                os.path.join(backup_path, source)))
        else:
            os.remove(dotfile_path)
            print('removed {}'.format(dotfile_path))

    for source in sources:
        dotfile_path = os.path.join(home_path, '.' + source)
        os.link(os.path.join(base_path, source), dotfile_path)
        print("linked {0} to {1}".format(os.path.join(base_path, source),
            dotfile_path))

if __name__ == '__main__':
    arguments = docopt(__doc__)
    if arguments['install']:
        install(arguments['--overwrite'], arguments['--backup'])
    elif arguments['update']:
        update(arguments['--skip-bash'])

