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

" Show EOL
set list
set listchars=eol:¬

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
let NERDTreeShowHidden = 1
let NERDTreeShowBookmarks = 1
let NERDTreeIgnore = ['^\.DS_Store$', '^\.Trash$', '\.swp$', '^\.dropbox']

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


" === Misc. ================================================

" Treat `*.note` as `note` filetype
autocmd BufNewFile,BufRead *.note set filetype=note

" Syntax matchs ([ ], [!], [x], Header:, `Code`)
autocmd FileType note syn match  Constant     /\[\s\].*$/
autocmd FileType note syn match  Comment      /\[x\].*$/
autocmd FileType note syn match  Type         /\[!\].*$/
autocmd FileType note syn match  StorageClass /^.*:$/
autocmd FileType note syn region String      start='`\+' end='`\+'

" <C-t> to add task, <C-d> to mark as done, <C-i> to mark as important
autocmd FileType note nnoremap <buffer> <C-t> o- [ ]<Space>
autocmd FileType note nnoremap <buffer> <silent> <C-d> :call FindReplace('\[.\]', '[x] [' . strftime("%Y-%m-%d") . ']')<CR>
autocmd FileType note nnoremap <buffer> <silent> <C-i> :call FindReplace('\[\s\]', '[!]')<CR>

function! FindReplace(from, to)
    call setline('.', substitute(getline('.'), a:from, a:to, ''))
endfunction

