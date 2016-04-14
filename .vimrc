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
set ruler         " Show scroll percentage

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
Plug 'airblade/vim-gitgutter'
call plug#end()

" Colorscheme
set background=light
try
    colorscheme PaperColor
catch 'Cannot find color scheme'
    colorscheme default
endtry

" nerdtree
let NERDTreeShowHidden = 1     " Show hidden files by default
let NERDTreeMouseMode  = 3     " Open file/dir by single click
map <C-n> :NERDTreeToggle<CR>  " Ctrl+N to NERDTreeToggle

" vim-gitgutter
" Set gutter sign colors
highlight GitGutterAdd          cterm=bold ctermfg=34
highlight GitGutterChange       cterm=bold ctermfg=172
highlight GitGutterChangeDelete cterm=bold ctermfg=172
highlight GitGutterDelete       cterm=bold ctermfg=160
