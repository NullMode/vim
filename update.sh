#!/bin/bash

# Get current directory if called from elsewhere
ORIGINAL_DIR=$(pwd)

# Get directory of script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

# Warning
echo -e "[!] WARNING - This script will update the project, installed plugins and color schemes."
echo -e "Type 'y' to continue."
read IN

if [ ! "$IN" = "y"  ]; then
    exit 0
fi

# Update project and submodules
echo "[*] Updating NullMode's config ..."
git pull
echo "[*] Updating git submodules (plugins) ..."
git submodule init && git submodule update && git submodule status

# Update Pathogen
echo "[*] Updating Pathogen ..."
rm .vim/autoload/pathogen.vim
curl -s -S -o .vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# Update color schemes
echo "[*] Updating Color Schemes ..."
rm -r .vim/colors/*.vim
curl -s -S -o .vim/colors/vividchalk.vim https://raw.githubusercontent.com/tpope/vim-vividchalk/master/colors/vividchalk.vim
curl -s -S -o .vim/colors/molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
curl -s -S -o .vim/colors/flatcolor.vim https://raw.githubusercontent.com/MaxSt/FlatColor/master/colors/flatcolor.vim

# Go back to original DIR
cd $ORIGINAL_DIR
