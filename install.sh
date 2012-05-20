#!/bin/bash
####
# This script creates symlinks from the home directory to any desired dotfiles
# in ~/dotfiles
####

dir=~/dotfiles        # dotfiles directory
olddir=~/dotfiles_old # Old dotfiles backup directory
files=".vimrc .vim"   # List of files/folders to symlink in homedir

# Create dotfiles_old in homedir.
if [ ! -e $olddir ]; then
    echo ""
    echo "Creating $olddir for backup of any existing dotfiles in ~"
    mkdir -p $olddir
fi

# Change to the dotfiles directory.
cd $dir

# Move any existing dotfiles in homedir to dotfiles_old directory, then create
# symlinks.
for file in $files; do
    echo ""
    echo "Linking $dir/$file to ~/$file"
    if [ -e ~/$file ]; then
        echo "Backing up existing $file from ~ to $olddir"
        if [ -e $olddir/$file ]; then
            echo "Removing existing backup $olddir/$file"
            # Could be a directory so -rf
            rm -rf $olddir/$file
        fi
        mv ~/$file $olddir
    fi
    ln -s $dir/$file ~/$file
    echo "Link created"
done
