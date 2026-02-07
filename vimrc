"------------------------------------------------------------------------------
" File: $HOME/.vimrc
" Author: Ramanan Sivaranjan
"------------------------------------------------------------------------------

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
Plug 'godlygeek/tabular'
" language specific plugins
Plug 'pangloss/vim-javascript'
Plug 'fatih/vim-go'
Plug 'preservim/vim-markdown'
Plug 'rust-lang/rust.vim'
Plug 'elzr/vim-json'

call plug#end()

" don't complain about unsaved buffers
set hidden

" Better command-line completion
set wildmenu
set wildmode=list:longest
set wildignore+=*.o,*.obj,*.pyc,*.class,.git,.hg,*.orig,static/**
set wildignore+=*.har,node_modules

" text formating
set autoindent
set nowrap

" default window size
set colorcolumn=80      " highlight the 80th column

" tabstops
set tabstop=4           " Number of spaces <tab> counts for.
set softtabstop=4       " Backspace will erase the same number of spaces as shiftwidth
set shiftwidth=4        " Number of spaces used when autoindenting and indenting multiple lines
set expandtab           " Tabs are turned to spaces.

augroup vimrc
  autocmd!
  " language specific formatting
  autocmd BufNewFile,BufRead .jshintrc setlocal ft=javascript
  autocmd BufNewFile,BufRead .hujson setlocal ft=json
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  " auto source vimrc when saved
  autocmd BufWritePost .vimrc source $MYVIMRC
augroup END

" search settings
set hlsearch            " Highlight search matches.
set incsearch           " Incremental search.
set ignorecase

" no mode lines.
set nomodeline

" history
set history=100         " Number of lines of command line history.
set undolevels=200      " Number of undo levels.

" display
set number              " display line number on left

" misc
set mouse=a             " use mouse
set showmatch           " Show matching brackets.
set scrolloff=5         " Keep a context when scrolling.
set nostartofline       " Do not jump to first character with page commands

set spell spelllang=en_ca

"
" shortcuts / keybindings
"

" change leader from \ to ,
let mapleader=","

" double j to enter command mode
inoremap jj <ESC>

" generate ISO date
iab <expr> dts strftime("%d %b %Y")

" use ; instead of : when you want to run a command
nnoremap ; :

" Quit with 'Q' instead of ':q'. VERY useful! Also
" this means you can't open stupid-ass ed.
nnoremap Q :q<CR>

" Enable this if you mistype :w as :W or :q as :Q.
command! W w
command! Q q

" Move through softwraped text
noremap j gj
noremap <down> gj
noremap k gk
noremap <up> gk

" Tell vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
nnoremap <leader>l :set list!<cr>
set list listchars=tab:>\ ,trail:-,eol:$
set nolist

" fzf mappings
let g:fzf_command_prefix = 'Fzf'
map <silent> <C-p> :FzfFiles<CR>

" stop highlighting search
nnoremap <silent> ,/ :nohlsearch<CR>

" nicer copy and paste to mac clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p

" open vimrc quickly
nnoremap <leader>v :tabedit $MYVIMRC<CR>

" open terminal quickly
noremap <silent> <Leader>ft :FloatermNew<CR>

" ALE config
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ }
nnoremap <silent> <leader>aj :ALENext<cr>
nnoremap <silent> <leader>ak :ALEPrevious<cr>
nnoremap <silent> <leader>ad :ALEGoToDefinition<CR>

" set up colour scheme
set background=light
let g:gruvbox_italic=1

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
  if (has("termguicolors"))
    set termguicolors
  endif
endif

function! ToggleBackground()
  if &background ==# 'dark'
    set background=light
  else
    set background=dark
  endif
endfunction

nnoremap <leader>d :call ToggleBackground()<CR>

colorscheme gruvbox
