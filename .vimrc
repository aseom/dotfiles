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

" Markdown show trailing spaces
autocmd FileType markdown set list
autocmd FileType markdown set listchars=trail:▪︎

" Search
set incsearch
set ignorecase
set hlsearch


" === Keymaps ==============================================

" Key combination timeout (ms)
set timeoutlen=300

" If autocompletion popup visable, <CR> to select next item
inoremap <expr> <CR> pumvisible() ? "\<C-n>" : "\<CR>"

" Open NERDTree
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

" Save, quit
nnoremap <silent> <C-s>      :update<CR>
inoremap <silent> <C-s> <ESC>:update<CR>
nnoremap <silent> q :q<CR>
nnoremap <silent> Q :qa<CR>

" Paste in newline
nnoremap <silent> pp :pu<CR>

" Easy indent
nnoremap <Tab>   >>
nnoremap <S-Tab> <<
vnoremap > >gv
vnoremap < <gv

" Add newline + ESC
nnoremap <CR> o<ESC>

" Clear search highlight
nnoremap <silent> <C-l> :nohlsearch<CR>

" Reload vimrc
nnoremap <silent> <F5> :source ~/.vimrc<CR>:echo "Reloaded!"<CR>


" === Plugins ==============================================

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
filetype plugin indent on

" fzf (Reqiured for fzf.vim)
set rtp+=~/.fzf

" colorscheme
try
    colorscheme wombat
catch 'Cannot find color scheme'
    colorscheme default
endtry

" vim-airline
let g:airline_theme="wombat"
let g:airline_powerline_fonts = 1

" neocomplete
set completeopt=menuone  " Popup even one item, no preview
let g:neocomplete#enable_at_startup = 1

" nerdtree
let NERDTreeShowHidden = 1
let NERDTreeShowBookmarks = 1
let NERDTreeIgnore = ['^\.DS_Store$', '^\.Trash$', '\.swp$', '^\.dropbox']

" vim-markdown-preview
" By default, <C-p> to activate preview
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Safari'
