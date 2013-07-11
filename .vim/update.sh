#!/bin/bash

# Get current directory if called from elsewhere
ORIGINAL_DIR=$(pwd)

# Get directory of script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Color variables
YS="\e[33m"
YE="\033[0m"

# Ding
DING="$YS""[*] ""$YE"

# Warning
echo -e "$DING"'WARNING - This script will update the installed plugins and color schemes.'
echo -e "$SING""Type 'y' to continue."
read IN

if [ ! "$IN" = "y"  ]; then
    exit 0
fi

# Change directory
cd $DIR

# Update NERDTree
echo -e "$DING"'Updating Pathogen ...'
rm autoload/pathogen.vim
curl -s -S -o autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# Update Pathogen
echo -e "$DING"'Updating NERDTree  ...'
rm -rf bundle/nerdtree/
cd bundle
git clone https://github.com/scrooloose/nerdtree.git
rm -rf nerdtree/.git
rm nerdtree/.gitignore
rm nerdtree/README.markdown
cd ..

# Update vividchalk color scheme
echo -e "$DING"'Updating VividChalk Color Scheme ...'
rm colors/vividchalk.vim
curl -s -S -o colors/vividchalk.vim https://raw.github.com/tpope/vim-vividchalk/master/colors/vividchalk.vim

# Return back
cd $ORIGINAL_DIR
