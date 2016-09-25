# NullMode's Personal vim Settings

## About
This compilation was simply made so I can quickly git clone my personal
vim settings onto newly installed machines.

## Overriding
Like some but not all of the config? You can override settings but creating a
**.my.vimrc** in your user's home directory (_my_vimrc on Windows in the same
folder as _vimrc). - NEEDS TESTING

## Requirements
* git
* pip
* vim
 * vim-nox (Debian users)
* curl

## Installation Instructions
* Navigate to a suitable download folder and run:
`git clone https://github.com/NullMode/vim.git`
* Install the packages above: `apt-get install git python-pip vim vim-nox curl`
* If you are not installing this as root you may need to install flake8 and
  isort manually
`sudo pip install flake8 isort`
* Running update.sh will pull down the submodules code
* The install.sh file will sync the contents of the cloned project to the user's $HOME directory.
* General configuration is kept in the .vimrc file

## Installing on Windows

There are two PowerShell scripts that can be used to update then install the configuration on windows. This has only been tested on my windows machine. Feedback and improvements welcome.

If you have problems with the isort plugin on windows, ensure that vim and python are running the same arcitecture (64 bit or 32 bit).

## Updating plugins
The update.sh file will update the project, plugins and color schemes in use (listed below)

## List of installed plugins
* Pathogen - https://github.com/tpope/vim-pathogen
* Vim Flake8 - https://github.com/nvie/vim-flake8
* Vim Git - https://github.com/tpope/vim-git
* Vim Fugitive - https://github.com/tpope/vim-fugitive
* Vim Bufferline - https://github.com/bling/vim-bufferline
* Vim Gitgutter - https://github.com/airblade/vim-gitgutter
* Vim Airline - https://github.com/bling/vim-airline
* IndentLine - https://github.com/Yggdroot/indentLine
* Vim Isort - https://github.com/fisadev/vim-isort
* Ps1.vim - https://github.com/PProvost/vim-ps1
* Vim Markdown - https://github.com/plasticboy/vim-markdown
* Jedi-VIM - https://github.com/davidhalter/jedi-vim
* Vim JSON - https://github.com/elzr/vim-json
* Vim Repeat - https://github.com/tpope/vim-repeat
* Vim Surround - https://github.com/tpope/vim-surround
* Vim Abolish - https://github.com/tpope/vim-abolish
* File Line - https://github.com/bogado/file-line
* Projectionist - https://github.com/tpope/vim-projectionist

## List of color schemes
* Molokai Color Scheme - https://github.com/tomasr/molokai
* Vividchalk Color Scheme - https://github.com/tpope/vim-vividchalk
* FlatColor Color Scheme - https://github.com/MaxSt/FlatColor

## Fonts (Install manually)
+ http://www.google.com/fonts/specimen/Droid+Sans+Mono

## Thanks
* lnxg33k for some great tips and a lot of stolen content from his vimrc
file :P
* g0tmi1k for actually motivating me to make this, no automation this time :)
* TheColonial for showing me a color scheme that might make my eyes last longer

# TODO
+ Full test on windows, linux and OSX
+ Get terminal version working in windows
