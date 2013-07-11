#!/bin/bash

# Get firectory of script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Color variables
YS="\e[33m"
YE="\033[0m"

# Ding
DING="$YS""[*] ""$YE"

# Check if vim is installed
if [ -z $(which vim) ] ; then
    echo -e "$DING"'install vim first before running this script!'
    echo -e "$DING"'apt-get install vim'
    echo -e "$DING"'yum install vim'
    exit 1
fi

# Mirror git clone to folder
echo -e "$DING"'Mirroring vim configuration from '"$DIR"' to '"$HOME"'/ ...'
rsync -rtv --exclude-from 'rsync-exclude.txt' $DIR/. $HOME/
echo -e "$DING"'Excluded files:'
cat $DIR/rsync-exclude.txt
echo -e "$DING"'Mirror completed. You may now delete this directory if required'
echo -e "$DING"'cd .. && rm '$(pwd)
echo -e "$DING"'You may leave the install.sh file here if you wish to re-sync in future.'

exit 0

