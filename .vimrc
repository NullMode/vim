" STAR, DEFAULT CONFIGURATION
" Remove comments
" Default configuration can usualy be found at /etc/vim/vimrc

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Bar marking 80 chars
set colorcolumn=80

" If syntax is available for file, use it
if has("syntax")
  syntax on
endif

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" START CUSTOM CONFIG

" Custom status line
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

" Allow the copying of text that doesn't include the line numbers
set mouse=

" Opening a new file when the current buffer has unsaved changes causes files
" to be hidden instead of closed
set hidden

" Auto write file when switching buffers
set autowrite

" Check how long a selection is
set showcmd

" Auto indentation
set autoindent

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme - Leave your desired colorscheme uncommented :)
colorscheme flatcolor

" Set the darker dark backgound
let g:flatcolor_asphaltbg=1

" Set background to dark
set background=dark

" Set terminal colors to 256
set t_Co=256

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype on
filetype plugin indent on
syntax on
set grepprg=grep\ -nH\ $*

" Showing line numbers and length
" set number  " show line numbers - disabled for relative line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing

" Setup relative line numbers and a toggle
set relativenumber
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set nonumber
        set relativenumber
    endif
endfunc

" Toggle into number when insert mode selected
autocmd InsertEnter * :set norelativenumber | set number
autocmd InsertLeave * :set nonumber | set relativenumber

" On focused lost switch to number
:au FocusLost * :set number
:au FocusGained * :set relativenumber

nnoremap <C-m> :call NumberToggle()<cr>

" Useful settings
set history=700
set undolevels=700

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set smarttab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Pathogen setup
" Turn on...
execute pathogen#infect()

" Disable CursorLine by default
set nocursorline

" Rebind esc to jj, srsly awesome
:map! jj <ESC>

" Auto completion with tab
set wildmenu
set wildmode=list:longest,full

" Tab autocompletion
function! Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

" Load Isort
source ~/.vim/bundle/vim-isort/ftplugin/python_vimisort.vim

" for Isort, sort your python imports
command! -range=% Isort :<line1>,<line2>! isort -

" Set font if in windows gvim, see link to font in README.md
if has("gui_win32")
    set guifont=Droid_Sans_Mono:h12:cANSI
endif

" Override file for overriding settings
if has("win32")
    if filereadable("_my_vim_rc")
        so _my_vimrc
    endif
else
    if filereadable(".my.vimrc")
        so .my.vimrc
    endif
endif

" If in html, two spaces for tabs only
autocmd FileType html setlocal shiftwidth=2 tabstop=2

" Fix typing derps
:command WQ wq
:command Wq wq
:command W w
:command Q q

" vim-markdown settings
let g:vim_markdown_folding_disabled=1

