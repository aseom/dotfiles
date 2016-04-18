syntax on
set mouse=a                     " Use mouse
set nocompatible                " Use arrows
set backspace=indent,eol,start  " Use backspace

set number        " Show line numbers
set cursorline    " Highlight current line
set laststatus=2  " Always show status bar
set ruler         " Show scroll percentage
set title         " Show window title

set expandtab  " Convert tabs to spaces
set autoindent
set splitright  " Split to right when `:vs`
set splitbelow  " Split to below when `:sp`

" Sync clipboard with OS
set clipboard=unnamed

" Tab size
set softtabstop=4
set tabstop=4
set shiftwidth=4

" Match brackets
set matchpairs=(:),{:},[:],<:>
set showmatch

" Search
set incsearch
set ignorecase
set hlsearch


" === Keymaps ==============================================

" Key combination timeout (ms)
set timeoutlen=300

" Ctrl+S, Ctrl+Z, Ctrl+Y
" Requires `stty -ixon` for Ctrl+S!
nnoremap <C-s>      :w<CR>
inoremap <C-s> <ESC>:w<CR>
nnoremap <C-z>      u
inoremap <C-z> <ESC>u
nnoremap <C-y>      <C-r>
inoremap <C-y> <ESC><C-r>

" Better than `ZZ`, `ZQ`
nnoremap q  :q<CR>
nnoremap qq :wq<CR>

" Paste in newline
nnoremap pp :pu<CR>

" Add newline + ESC
nnoremap <CR> o<ESC>

" Clear search highlight
nnoremap <C-l> :nohlsearch<CR>

" Open NERDTree
nnoremap <C-e> :NERDTreeToggle<CR>


" === Plugins ==============================================

" Manage plugins with `vim-plug`
call plug#begin('~/.vim/plugged')
Plug 'NLKNguyen/papercolor-theme'
Plug 'Shougo/neocomplete.vim'
Plug 'ternjs/tern_for_vim'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
call plug#end()

" papercolor-theme
set background=light
try
    colorscheme PaperColor
catch 'Cannot find color scheme'
    colorscheme default
endtry

" neocomplete
set completeopt=menuone
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#auto_completion_start_length = 0

" nerdtree
let NERDTreeShowHidden = 1     " Show hidden files by default

" vim-gitgutter
" Set gutter sign colors
highlight GitGutterAdd          cterm=bold ctermfg=34
highlight GitGutterChange       cterm=bold ctermfg=214
highlight GitGutterChangeDelete cterm=bold ctermfg=214
highlight GitGutterDelete       cterm=bold ctermfg=160
