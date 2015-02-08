# Function for switch dirs if not in the udpate.ps1 directory
function Get-ScriptDirectory
{
  $Invocation = (Get-Variable MyInvocation -Scope 1).Value
  Split-Path $Invocation.MyCommand.Path
}

# Just in case running from another dir
$original_path = (Get-Item -Path ".\" -Verbose).FullName
$script_path = Get-ScriptDirectory
cd $script_path

# Warning
echo "[!] WARNING - This script will update the project, installed plugins and color schemes."
echo "Type 'y' to continue."
$input = Read-Host

if ($input -ne "y"){
    break
}

# Update project and submodules
echo "[*] Updating NullMode's config ..."
git pull
echo "[*] Updating git submodules (plugins) ..."
git submodule init
git submodule update --recursive
git submodule status

# Update Pathogen and Color Schemes
$storageDir = $pwd
$webclient = New-Object System.Net.WebClient

echo "[*] Updating Pathogen ..."
If (Test-Path .vim/autoload/pathogen.vim){rm .vim/autoload/pathogen.vim}
wget https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim -OutFile .vim/autoload/pathogen.vim

echo "[*] Updating Color Schemes ..."
rm .vim/colors/*.vim 
wget https://raw.githubusercontent.com/tpope/vim-vividchalk/master/colors/vividchalk.vim -OutFile .vim/colors/vividchalk.vim
wget https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim -OutFile .vim/colors/molokai.vim
wget https://raw.githubusercontent.com/MaxSt/FlatColor/master/colors/flatcolor.vim -OutFile .vim/colors/flatcolor.vim

cd $original_path
