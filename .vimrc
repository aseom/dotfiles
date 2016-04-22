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
set showmatch  " Highlight brackets
set autoindent

set splitright  " Split to right when `:vs`
set splitbelow  " Split to below when `:sp`

" Sync clipboard with OS
set clipboard=unnamed

" Tab size
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Show trailing spaces
set list
set listchars=trail:×

" Search
set incsearch
set ignorecase
set hlsearch


" === Keymaps ==============================================

" Key combination timeout (ms)
set timeoutlen=300

" If autocompletion popup visable, <CR> to select next item
inoremap <expr> <CR> pumvisible() ? "\<C-n>" : "\<CR>"

" Save, quit
nnoremap <C-s>      :update<CR>
inoremap <C-s> <C-o>:update<CR>
nnoremap <C-q>      :q<CR>
inoremap <C-q> <C-o>:q<CR>

" Paste in newline
nnoremap pp :pu<CR>

" Add newline + ESC
nnoremap <CR> o<ESC>

" Clear search highlight
nnoremap <C-l> :nohlsearch<CR>

" Open NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>


" === Plugins ==============================================

" Manage plugins with `vim-plug`
call plug#begin('~/.vim/plugged')

Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Shougo/neocomplete.vim'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'ternjs/tern_for_vim'
Plug 'JamshedVesuna/vim-markdown-preview'

call plug#end()

" papercolor-theme
set background=light
let g:PaperColor_Light_Override = {'background': '#FFFFFF', 'cursorline': '#FCFCFC'}
try
    colorscheme PaperColor
catch 'Cannot find color scheme'
    colorscheme default
endtry

" vim-airline
let g:airline_powerline_fonts = 1

" neocomplete
set completeopt=menuone  " Popup even one item, no preview
let g:neocomplete#enable_at_startup = 1

" nerdtree
let NERDTreeShowHidden = 1     " Show hidden files by default

" vim-gitgutter
" Set gutter sign colors
highlight GitGutterAdd          cterm=bold ctermfg=34
highlight GitGutterChange       cterm=bold ctermfg=214
highlight GitGutterChangeDelete cterm=bold ctermfg=214
highlight GitGutterDelete       cterm=bold ctermfg=160

" vim-markdown-preview
" By default, <C-p> to activate preview
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Safari'
