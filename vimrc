" ------------------------------------
"  My Vim power :)
"
"  Collected by: Alberto Lorenzo
" 
" ------------------------------------

" -----------------
" Aspect and colors
" -----------------
syntax on
colorscheme koehler

" ----------------------------------
" Rememeber some things when exiting
" ----------------------------------
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" --------------------------------
" Auto-Jump last editting position
" --------------------------------
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END


" ------------
" Search stuff
" ------------
set hlsearch   " Highlight search terms
set incsearch  " Show matches as you type
set ignorecase " Ignore case when searching
set smartcase  " Ignore case if search pattern is all lowercase, case-sensitive otherwise
set showmatch  " Set show matching parenthesis

" ---------------------------
" Identation and syntax stuff
" ---------------------------
set ts=4
set sw=4

" Use 2 spaces on ruby files
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
"Thorfile ruby syntax
autocmd BufRead,BufNewFile Thorfile set filetype=ruby

set expandtab  " Convert tabs on spaces
set shiftround " use multiple of shiftwidth when indenting with '<' and '>' 
               " if u have a line indented on col 10 and your ts=4 with shiftround '<' will indent to col=8
               " if u dont have shiftround '<' will indent to col=6
set ruler      " Show position of the cursor all time
set autoindent " Activate autoindentation (great for python)


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

" -----------------------
" Interface
" -----------------------
  
set title " Change terminal's title

" Allways open split panes on the right below
set splitbelow
set splitright
" Move cursos between panes directly Ctrl+[HJKL]
"
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>

" Be silent about invalid cursor moves and errors
set visualbell   " don't beep
set noerrorbells " don't beep

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


" My bundlers
" 
Bundle 'snipMate'

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

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Be silent about invalid cursor moves and errors
set visualbell   " don't beep
set noerrorbells " don't beep

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


" My bundlers
" 
Bundle 'snipMate'

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

