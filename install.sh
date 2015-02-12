#!/bin/bash

# Get directory of script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check if vim is installed
if [ -z $(which vim) ] ; then
    echo '[*] install vim first before running this script!'
    echo '[*] apt-get install vim'
    echo '[*] If Isort gives you errors because of no python run the following:'
    echo '[*] apt-get install vim-nox'
    exit 1
fi

# Check if git is installed
if [ -z $(which git) ] ; then
    echo '[*] install git first before running this script!'
    echo '[*] apt-get install git'
    exit 1
fi

# Check if pip is installed
if [ -z $(which pip) ] ; then
    echo '[*] install pip first before running this script!'
    echo '[*] apt-get install python-pip'
    exit 1
fi

# Installing flake8 and isort
pip install flake8 isort

# Mirror git clone to folder
echo '[*] Mirroring vim configuration from '"$DIR"' to '"$HOME"'/ ...'
rsync -rtv --exclude-from 'rsync-exclude.txt' $DIR/. $HOME/
echo '[*] Excluded files:'
cat $DIR/rsync-exclude.txt
echo '[*] Mirror completed. You may now delete this directory if required'
echo '[*] cd .. && rm '$(pwd)
echo '[*] You may leave the install.sh file here if you wish to re-sync in future.'
