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


# Update Pathogen
echo -e "$DING"'Updating Pathogen ...'
rm autoload/pathogen.vim
curl -s -S -o autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

cd bundle

# Update indentline
echo -e "$DING"'Updating indentLine ...'
rm -rf indentLine/
git clone https://github.com/Yggdroot/indentLine.git
rm -rf indentLine/.git
rm indentLine/.gitignore

# Update NERDTree
echo -e "$DING"'Updating NERDTree  ...'
rm -rf nerdtree/
git clone https://github.com/scrooloose/nerdtree.git
rm -rf nerdtree/.git
rm nerdtree/.gitignore
rm nerdtree/README.markdown
rm -rf bundle/nerdtree/

# Update vim-flake8
echo -e "$DING"'Updating flake8 ...'
rm -rf vim-flake8/
git clone https://github.com/nvie/vim-flake8.git
rm -rf vim-flake8/.git
rm vim-flake8/README.mdown

# Update vim-git
echo -e "$DING"'Updating vim-git ...'
rm -rf vim-git
git clone https://github.com/tpope/vim-git

# Update fugitive
echo -e "$DING"'Updating fugitive ...'
rm -rf vim-fugitive
git clone https://github.com/tpope/vim-fugitive

cd ..

# Update vividchalk color scheme
echo -e "$DING"'Updating VividChalk Color Scheme ...'
rm colors/vividchalk.vim
curl -s -S -o colors/vividchalk.vim https://raw.githubusercontent.com/tpope/vim-vividchalk/master/colors/vividchalk.vim 

# Return back
cd $ORIGINAL_DIR
