#!/bin/bash

# Get directory of script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Color variables
YS="\E[33m;42"
YE="\033[0m"

# Ding
DING="$YS""[*] ""$YE"

# Check if vim is installed
if [ -z $(which vim) ] ; then
    echo -e "$DING"'install vim first before running this script!'
    echo -e "$DING"'apt-get install vim'
    exit 1
fi

# Check if git is installed
if [ -z $(which git) ] ; then
    echo -e "$DING"'install git first before running this script!'
    echo -e "$DING"'apt-get install git'
    exit 1
fi

# Check if pip is installed
if [ -z $(which pip) ] ; then
    echo -e "$DING"'install pip first before running this script!'
    echo -e "$DING"'apt-get install python-pip'
    exit 1
fi

# Installing flake8
pip install flake8

# Mirror git clone to folder
echo -e "$DING"'Mirroring vim configuration from '"$DIR"' to '"$HOME"'/ ...'
rsync -rtv --exclude-from 'rsync-exclude.txt' $DIR/. $HOME/
echo -e "$DING"'Excluded files:'
cat $DIR/rsync-exclude.txt
echo -e "$DING"'Mirror completed. You may now delete this directory if required'
echo -e "$DING"'cd .. && rm '$(pwd)
echo -e "$DING"'You may leave the install.sh file here if you wish to re-sync in future.'
