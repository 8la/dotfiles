" ------------------------------------
"  My Vim power :)
"
"  Collected by: Alberto Lorenzo
" 
" ------------------------------------

syntax on
colorscheme koehler

" ------------
" Search stuff
" ------------
set hlsearch   " Highlight search terms
set incsearch  " Show matches as you type
set ignorecase " Ignore case when searching
set smartcase  " Ignore case if search pattern is all lowercase, case-sensitive otherwise
set showmatch  " Set show matching parenthesis

" ----------------
" Identation stuff
" ----------------
set ts=4
set sw=4
set expandtab  " Convert tabs on spaces
set shiftround " use multiple of shiftwidth when indenting with '<' and '>' 
               " if u have a line indented on col 10 and your ts=4 with shiftround '<' will indent to col=8
               " if u dont have shiftround '<' will indent to col=6
set ruler      " Show position of the cursor all time
set autoindent " Activate autoindentation (great for python)

set backspace=indent,eol,start " allow backspacing over everything in insert mode

" Hide a buffer instead of closing it so you can have unwritten changes on 
" a buffer and edit a new one without being forced to write or undo changes first. 

set hidden

" ---------------------------
" Commands and tab completion
" ---------------------------

" Large history and undo buffer
set history=500
set undolevels=500

" Ignore some extensions when tab completing filenames
set wildignore=*.swp,*.bak,*.pyc

" Show autocomplete menu for commands
set wildmenu


" ---------------------------
" Vundle  plugin requirements
" ---------------------------
set nocompatible   " Use Vi Improved enviroment and behaviour
filetype off

" Include vundle in the runtime path
set rtp+=~/.vim/bundle/vundle/
" Launch vundle
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

filetype plugin indent on     " required! 


"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" Some Shortcuts...

let mapleader="," " Change the mapleader from default '\' to ',' 

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

