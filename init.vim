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

" sourcing vimrc in git repos
let git_path = system("git rev-parse --show-toplevel 2>/dev/null")
let git_vimrc = substitute(git_path, '\n', '', '') . "/.git/vimrc"
if !empty(glob(git_vimrc))
    exec ":source " . git_vimrc
endif

" Highlight trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
