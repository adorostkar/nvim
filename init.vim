let mapleader = " "
let maplocalleader = " "

lua require('config')

" enable line numbering
set nu
set relativenumber

set hlsearch
set incsearch
set smartcase
set ignorecase

set tabstop=4
set shiftwidth=4
set expandtab

" Hide markup characters where syntax rules support concealment.
set conceallevel=2

let s:undo_dir = stdpath('state') . '/undo'
call mkdir(s:undo_dir, 'p', 0700)

set undofile
let &undodir = s:undo_dir

set undolevels=1000
set undoreload=10000
set history=5000
