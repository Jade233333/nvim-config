" Portable Vim Configuration
" Extracted from nvim config for use with vanilla vim

" Leader key
let mapleader = " "
let maplocalleader = " "

" Line numbers
set number
set relativenumber

" Indentation settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Visual guide
set colorcolumn=80

" Line wrapping
set nowrap
set linebreak
set breakindent

" File handling
set noswapfile
set nobackup
if !isdirectory($HOME . "/.vim/undodir")
    call mkdir($HOME . "/.vim/undodir", "p")
endif
set undodir=~/.vim/undodir
set undofile

" Search settings
set hlsearch
set incsearch
set ignorecase
set smartcase

" Scrolling
set scrolloff=4

" Sign column
set signcolumn=yes

" Update time
set updatetime=50

" System clipboard
set clipboard=unnamedplus

" Hide status line
set laststatus=0

" Key mappings
" Open file explorer
nnoremap <leader>l :Ex<CR>

" Move selected lines up/down in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Move by visual line when lines wrap
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk

" Preserve register when pasting over visual selection
xnoremap p "_dP
