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

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'rodjek/vim-puppet'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tsaleh/vim-align'
Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'morhetz/gruvbox'

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
    autocmd Filetype make setlocal sw=8 sts=8 ts=8 noexpandtab
    autocmd FileType ruby setlocal sw=2 sts=2 ts=2
    autocmd FileType javascript setlocal sw=2 sts=2 ts=2
    autocmd FileType markdown setlocal wrap linebreak
    autocmd BufNewFile,BufRead *.json,.jshintrc setlocal ft=javascript
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

" double j to enter command mode
imap jj <ESC>

iab <expr> dts strftime("%d %b %Y")

iab settrace import pdb; pdb.set_trace()

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

" change leader from \ to ,
let mapleader=","

" Tell vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
" nmap <leader>l :set list!<cr>
" set list listchars=tab:>\ ,trail:-,eol:$

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

" auto source vimrc when saved
autocmd BufWritePost .vimrc source $MYVIMRC

" command-t options
let g:CommandTMaxHeight = 10

" Markdown Config
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1

" ALE config
let g:ale_fix_on_save = 1
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>
