#!/bin/bash
####
# This script creates symlinks from the home directory to any desired dotfiles
# in ~/dotfiles
####

# dotfiles directory
dir=~/Code/gshutler/dotfiles
# Old dotfiles backup directory
olddir=~/dotfiles_old
# List of files/folders to symlink in homedir
files=".config .vimrc .vim .gitconfig .gitconfig-cronofy .gitignore_global bin .bash_profile_dotfiles .slate .tmux.conf"

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

echo ""
sourcecmd="source \$HOME/.bash_profile_dotfiles"

# Ensure .bash_profile_dotfiles sourced from ~/.bash_profile
if grep --quiet "$sourcecmd" ~/.bash_profile ; then
  echo ".bash_profile_dotfiles already sourced from ~/.bash_profile"
else
  echo "Appending \"$sourcecmd\" to ~/.bash_profile"
  echo -e "\n$sourcecmd" >> ~/.bash_profile
fi
