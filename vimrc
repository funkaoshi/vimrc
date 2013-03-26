"------------------------------------------------------------------------------
" File: $HOME/.vimrc
" Author: Ramanan Sivaranjan
"------------------------------------------------------------------------------

" to run will work with no weird side effects.
set nocompatible

" run pathogen to manage our plugins, all installed inside vim/bundles
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" gui font
set guifont=Consolas:h12

" Enable syntax-highlighting.
syntax on
colorscheme solarized
set bg=light

" don't complain about unsaved buffers
set hidden

" Better command-line completion
set wildmenu
set wildmode=list:longest
set wildchar=<TAB>
set wildignore+=*.o,*.obj,*.pyc,*.class,.git,.hg,*.orig,static/**

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
    autocmd BufNewFile,BufRead *.json,.jshintrc set ft=javascript
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
set nu

" misc
set mouse=a             " use mouse
set ruler               " Show the line and column numbers of the cursor.
set showmode            " Show current mode.
set showmatch           " Show matching brackets.
set scrolloff=5         " Keep a context when scrolling.
set noerrorbells        " No beeps.
set esckeys             " Cursor keys in insert mode.
set magic               " Use 'magic' patterns (extended regular expressions).
set ttyfast             " We have a fast terminal connection.
set encoding=utf-8      " Set default encoding to UTF-8.
set nostartofline       " Do not jump to first character with page commands
set laststatus=2        " status line on second last line

set spell spelllang=en_ca

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" double j to enter command mode
imap jj <ESC>

iab <expr> dts strftime("%d %b %Y")

" use ; instead of : when you want to run a command
nnoremap ; :

" Quit with 'Q' instead of ':q'. VERY useful! Also
" this means you can't open stupid-ass ed.
map Q :q<CR>

" Enable this if you mistype :w as :W or :q as :Q.
nmap :W :w
nmap :Q :q

map j gj
map k gk

" stop highlighting search
nmap <silent> ,/ :nohlsearch<CR>

" change leader from \ to ,
let mapleader=","

" Tell vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
set listchars=tab:>-,trail:·,eol:¬
nmap <leader>l :set list!<cr>

" open vimrc quickly
nmap <leader>v :tabedit $MYVIMRC<CR>

" open nerdtree
nmap <leader>n :NERDTreeToggle<CR>

" auto source vimrc when saved
autocmd BufWritePost .vimrc source $MYVIMRC

" command-t options
let g:CommandTMaxHeight = 10

" sparkup options
let g:sparkupNextMapping = '<c-x>'


function! Preserve(command)
    "Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" clean up trailing witespace
nmap <leader>$ :call Preserve("%s/\\s\\+$//e")<CR>

" clean up trailing white space on save
autocmd BufWritePre * :call Preserve("%s/\\s\\+$//e")
