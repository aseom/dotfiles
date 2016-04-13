syntax on
set mouse=a                     " Use mouse
set nocompatible                " Use arrows
set backspace=indent,eol,start  " Use backspace

" Customize
set title       " Show window title
set number      " Show line numbers
set cursorline  " Highlight current line
set smartindent
set laststatus=2  " Always show status bar

" Convert tabs to spaces
set expandtab

" Tab size
set softtabstop=4
set tabstop=4
set shiftwidth=4

" Match brackets
set matchpairs=(:),{:},[:],<:>
set showmatch

" Search
set ignorecase
set hlsearch

" Plugin
call plug#begin('~/.vim/plugged')
Plug 'NLKNguyen/papercolor-theme'
Plug 'scrooloose/nerdtree'
call plug#end()

" Colorscheme
set background=light
try
    colorscheme PaperColor
catch 'Cannot find color scheme'
    colorscheme default
endtry

" nerdtree
map <C-n> :NERDTreeToggle<CR>  " Ctrl+N to NERDTreeToggle
