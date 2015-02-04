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
echo -e "$DING"'WARNING - This script will update the project, installed plugins and color schemes.'
echo -e "$SING""Type 'y' to continue."
read IN

if [ ! "$IN" = "y"  ]; then
    exit 0
fi

# Update project and submodules
git pull
git submodule foreach git pull

# Update Pathogen
echo -e "$DING"'Updating Pathogen ...'
rm ./vim/autoload/pathogen.vim
curl -s -S -o ./vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# Update color schemes
echo -e "$DING"'Updating VividChalk & Moloka Color Schemes ...'
rm colors/*.vim
curl -s -S -o ./vim/colors/vividchalk.vim https://raw.githubusercontent.com/tpope/vim-vividchalk/master/colors/vividchalk.vim
curl -s -S -o ./vim/colors/molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
curl -s -S -o ./vim/colors/flatcolor.vim https://raw.githubusercontent.com/MaxSt/FlatColor/master/colors/flatcolor.vim

# Return back
cd $ORIGINAL_DIR
