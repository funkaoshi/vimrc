"------------------------------------------------------------------------------
" File: $HOME/.vimrc
" Author: Ramanan Sivaranjan
"------------------------------------------------------------------------------

" to run will work with no weird side effects.
set nocompatible

"
" Setup Environment using vim-plug
"

call plug#begin('~/.vim/plugged')

" file searching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" colour scheme
Plug 'morhetz/gruvbox'
" async syntax / linting
Plug 'dense-analysis/ale'
" commandline bar
Plug 'vim-airline/vim-airline'
" built-in terminal
Plug 'voldikss/vim-floaterm'
" focus-mode text editing
Plug 'junegunn/goyo.vim'
" quickly comment / uncomment text
Plug 'tpope/vim-commentary'
" git integration
Plug 'tpope/vim-fugitive'
" quickly align text
Plug 'tsaleh/vim-align'
Plug 'godlygeek/tabular'
" editor config integration
Plug 'editorconfig/editorconfig-vim'
" language specific plugins
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'rodjek/vim-puppet'
Plug 'fatih/vim-go'
Plug 'preservim/vim-markdown'
Plug 'rust-lang/rust.vim'

call plug#end()

" Enable syntax-highlighting.
syntax on
let g:gruvbox_italic=1
colorscheme gruvbox

" don't complain about unsaved buffers
set hidden

" Better command-line completion
set wildmenu
set wildmode=list:longest
set wildchar=<TAB>
set wildignore+=*.o,*.obj,*.pyc,*.class,.git,.hg,*.orig,static/**
set wildignore+=*.har,node_modules

" Show partial commands in the last line of the screen
set showcmd

" text formating
filetype plugin indent on
set autoindent
set nosmartindent
set nowrap

" default window size
set colorcolumn=80      " highlight the 80th column

" tabstops
set tabstop=4           " Number of spaces <tab> counts for.
set softtabstop=4       " Backspace will erase the same number of spaces as shiftwidth
set shiftwidth=4        " Number of spaces used when autoindenting and indenting multiple lines
set expandtab           " Tabs are turned to spaces.

if has("autocmd")
    " language specific formatting
    autocmd BufNewFile,BufRead *.json,.jshintrc setlocal ft=javascript
    " auto source vimrc when saved
    autocmd BufWritePost .vimrc source $MYVIMRC
endif

" search settings
set hlsearch            " Highlight search matches.
set incsearch           " Incremental search.
set ignorecase

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" no mode lines.
set nomodeline

" history
set history=100         " Number of lines of command line history.
set undolevels=200      " Number of undo levels.

" gui options
set guioptions-=T       " no more toolbar
set number              " display line number on left

" misc
set encoding=utf-8      " Set default encoding to UTF-8.
set mouse=a             " use mouse
set ruler               " Show the line and column numbers of the cursor.
set showmode            " Show current mode.
set showmatch           " Show matching brackets.
set scrolloff=5         " Keep a context when scrolling.
set noerrorbells        " No beeps.
set magic               " Use 'magic' patterns (extended regular expressions).
set ttyfast             " We have a fast terminal connection.
set nostartofline       " Do not jump to first character with page commands
set laststatus=2        " status line on second last line

set spell spelllang=en_ca

"
" shortcuts / keybindings
"

" change leader from \ to ,
let mapleader=","

" double j to enter command mode
imap jj <ESC>

" generate ISO date
iab <expr> dts strftime("%d %b %Y")

" use ; instead of : when you want to run a command
nnoremap ; :

" Quit with 'Q' instead of ':q'. VERY useful! Also
" this means you can't open stupid-ass ed.
map Q :q<CR>

" Enable this if you mistype :w as :W or :q as :Q.
nmap :W :w
nmap :Q :q

" Move through softwraped text
noremap j gj
noremap <down> gj
noremap k gk
noremap <up> gk

" Tell vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
nmap <leader>l :set list!<cr>
set list listchars=tab:>\ ,trail:-,eol:$
set nolist

" fzf mappings
let g:fzf_command_prefix = 'Fzf'
map <silent> <C-p> :FzfFiles<CR>

" stop highlighting search
nmap <silent> ,/ :nohlsearch<CR>

" nicer copy and paste to mac clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p

" open vimrc quickly
nmap <leader>v :tabedit $MYVIMRC<CR>

" open terminal quickly
noremap <silent> <Leader>ft :FloatermNew<CR>

" ALE config
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ }
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>
nmap <silent> <leader>ad :ALEGoToDefinition<CR>
