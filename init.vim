lua require('config')

" enable line numbering
set nu

set hlsearch
set incsearch
set smartcase
set ignorecase

set tabstop=4
set shiftwidth=4
set expandtab

if !isdirectory($HOME . "/.cache/nvim")
    call mkdir($HOME . "/.cache/nvim", "", 0770)
endif

if !isdirectory($HOME . "/.cache/nvim/undos")
    call mkdir($HOME . "/.cache/nvim/undos", "", 0700)
endif

set undofile
set undodir=$HOME/.cache/nvim/undos

set undolevels=1000
set undoreload=10000
set history=5000

