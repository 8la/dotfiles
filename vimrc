" ------------------------------------
"  My Vim power :)
"
"  Collected by: Alberto Lorenzo
" 
" ------------------------------------



" ---------------------------
" Vundle  plugin requirements
" ---------------------------
set nocompatible   " Use Vi Improved enviroment and behaviour
filetype off

" Include vundle in the runtime path
set rtp+=~/.vim/bundle/Vundle.vim
" Launch vundle
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'


" My bundlers
" -----------

" ---------------------------
"  Syntastic lint
" ---------------------------
Plugin 'vim-syntastic/syntastic'
let g:syntastic_yaml_checkers = ['yamllint']
" ---------------------------
" SnipMate for tab completion
" ---------------------------
Plugin 'snipMate'
filetype plugin indent on     " required! 

" --------------------------
" Status bar with steroids
" --------------------------
Plugin 'bling/vim-airline'

Plugin 'catppuccin/vim', { 'as': 'catppuccin' }

" Required for vim-airline

set t_Co=256      " Enable 256 colors in vim
set laststatus=2
let g:airline_powerline_fonts = 1

" --------------------------
" Quoting and parenthesizing
" --------------------------
Plugin 'tpope/vim-surround'

" --------------------------
" Git wrapper
" --------------------------
Plugin 'tpope/vim-fugitive'


" --------------------------
" python-mode
" --------------------------
Plugin 'klen/python-mode'

" Required for python-mode 
autocmd Filetype python filetype plugin on
autocmd Filetype python filetype indent on

" --- END python-mode ---

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

" -----------------
" Aspect and colors
" -----------------
syntax on
set background=dark
#colorscheme solarized
colorscheme catppuccin_mocha

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
set modeline

" ---------------------------
" Identation and syntax stuff
" ---------------------------
set ts=4
set sts=4
set sw=4

set foldenable
set foldmethod=indent
" Start wit all folds open
set foldlevel=20

" ---------------
"  Ruby
" ---------------

" Use 2 spaces on ruby files
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

"Thorfile ruby syntax
autocmd BufRead,BufNewFile Thorfile set filetype=ruby

" Use 2 spaces on yml files
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2

" Use 2 spaces on erb files
autocmd Filetype eruby setlocal ts=2 sts=2 sw=2




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
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Move cursos between panes directly Ctrl+Cursor
"
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>

" Be silent about invalid cursor moves and errors
set visualbell   " don't beep
set noerrorbells " don't beep
let mapleader="," " Change the mapleader from default '\' to ',' 

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
