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

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Quicks save cksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

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
" colorscheme vividchalk
" colorscheme molokai
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

" Auto completion with tab
set wildmenu
set wildmode=list:longest,full

" Showing line numbers and length
" set number  " show line numbers - disabled for relative line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
" set colorcolumn=80
" highlight ColorColumn ctermbg=233

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

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Useful settings
set history=700
set undolevels=700

" Folding settings
set foldmethod=marker
nnoremap <space> za

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

" Vim isort 
Bundle 'fisadev/vim-isort'

" NERDTree setup
" Open NERDTree if no arguments where given
autocmd vimenter * if !argc() | NERDTree | endif

" Map ctrl N to open NERDTree
map <leader>. :NERDTreeToggle<CR>

" Close vim if only NERDTree is left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Show hidden files
let NERDTreeShowHidden=1

" Remove strange symbols
let g:NERDTreeDirArrows=0

" Use current directory
let g:NERDTreeChDirMode=2

" Disable CursorLine by default
set nocursorline

" Default Colors for CursorLine
highlight  CursorLine ctermbg=DarkGrey ctermfg=white

" Change Color when entering Insert Mode
autocmd InsertEnter * highlight  CursorLine ctermbg=None ctermfg=None

" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight  CursorLine ctermbg=DarkGrey ctermfg=white

" Rebind esc to jj, srsly awesome
:map! jj <ESC>

" Tab autocompletion
function! Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
" :set dictionary="/usr/dict/words"
