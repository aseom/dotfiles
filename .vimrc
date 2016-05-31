" Settings {{{
" ============

syntax on
set mouse=a                     " Use mouse
set nocompatible                " Use arrows
set backspace=indent,eol,start  " Use backspace

set number        " Show line numbers
set cursorline    " Highlight current line
set laststatus=2  " Always show status bar
set ruler         " Show scroll percentage
set title         " Show window title
set scrolloff=5

set expandtab  " Convert tabs to spaces
set showmatch  " Highlight brackets
set autoindent

set nowrap
"set nofoldenable
set clipboard=unnamed  " Sync clipboard with OS

set splitright  " Split to right when `:vs`
set splitbelow  " Split to below when `:sp`

" Tab size
set tabstop=4
set softtabstop=4
set shiftwidth=4
autocmd FileType javascript setlocal ts=2 sts=2 sw=2

" Search
set incsearch
set ignorecase
set hlsearch

" Conceal
set concealcursor=
set conceallevel=2

" 80 column ruler
set textwidth=80
set colorcolumn=+1

" Fix mouse in tmux
if &term =~ '^screen'
    set ttymouse=xterm2
endif

" MacVim
" Quit after last window closes:
" defaults write org.vim.MacVim MMLastWindowClosedBehavior 2
if has("gui_macvim")
    set guifont=Menlo:h14
    set linespace=1
    set guioptions-=L
    set noimdisable  " Auto switch input source
endif

" NERDTree + Startify
autocmd VimEnter * if !argc() | Startify | NERDTree | endif

" }}}

" Keymaps, Commands {{{
" =====================

" Use `:help index` to see the default key bindings

" Key combination timeout (ms)
set timeoutlen=300

" If autocompletion popup visable, <Tab> to select next item
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"

" Open NERDTree
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

" Fugitive
function! s:on_fugitive()
    nnoremap <C-g> :Gstatus<CR>
    command! -nargs=* Gdiff     Git! diff <args>
    command! -nargs=* GdiffHead Git! diff HEAD <args>
    command! -nargs=* GaddAll   Git add -A <args>
    command! -nargs=* GpushHead Gpush origin HEAD <args>
endfunction
autocmd User Fugitive call s:on_fugitive()

" Save, quit
nnoremap <silent> <C-s>      :update<CR>
inoremap <silent> <C-s> <ESC>:update<CR>
nnoremap <silent> q :q<CR>
nnoremap <silent> Q :qa<CR>

" Undo, redo, paste
" Use `[p` to paste and adjust indent
nnoremap <C-z>      u
inoremap <C-z> <C-o>u
inoremap <C-r> <C-o><C-r>
nnoremap <C-v>      p
inoremap <C-v> <C-o>p

" Drop selection and paste
vnoremap p "_dP

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

" Open iTerm in current directory
if has('mac')
    nnoremap <C-k> :silent !open -a iTerm .<CR>
endif

" }}}

" Plugins {{{
" ===========

call plug#begin('~/.vim/bundle')

" PlugUpdate:  Install or update plugins
" PlugUpgrade: Upgrade vim-plug itself
" PlugClean:   Remove unused directories

"Plug 'NLKNguyen/papercolor-theme'
Plug 'zefei/cake16'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/neocomplete.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify'

" Languages
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node',       { 'for': 'javascript' }
Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
Plug 'hdima/python-syntax', { 'for': 'python' }
Plug 'keith/swift.vim'
" vim-markdown depends on tabular
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'JamshedVesuna/vim-markdown-preview', { 'for': 'markdown' }
Plug 'tmux-plugins/vim-tmux'

" Awesome
"Plug 'aseom/vim-nodejs-complete', { 'for': 'javascript' }
Plug 'aseom/vim-notetaking'
"Plug 'aseom/vim-inputswitch'

" Add plugins to &runtimepath
call plug#end()


" colorscheme
set background=light
try
    "colorscheme PaperColor
    colorscheme cake16
    hi Normal       guifg=#484040 guibg=#fffdfa
    hi CursorLine   guifg=NONE    guibg=#f6f4eb
    hi CursorLineNr guifg=NONE    guibg=#f6f4eb
    hi ColorColumn  guifg=NONE    guibg=#f0f0e8
catch 'Cannot find color scheme'
    colorscheme default
endtry

" vim-airline
let g:airline_theme='light'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" neocomplete
set completeopt=menuone  " Popup even one item, no preview
let g:neocomplete#enable_at_startup = 1
" Call omni completion [O] for specific pattern matchs
let g:neocomplete#sources#omni#input_patterns = { 'javascript': '\h\w\+' }

" nerdtree
let NERDTreeWinSize = 26
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let NERDTreeShowBookmarks = 1
let NERDTreeIgnore = ['^\.DS_Store$', '^\.Trash$', '\.swp$', '^\.dropbox']

"syntastic
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_stl_format = "Syntax:%F (%t)"
let g:syntastic_javascript_checkers = ['eslint']

" indentLine
let g:indentLine_color_gui = "#ede4d4"
" https://github.com/Yggdroot/indentLine/issues/109
let g:indentLine_conceallevel  = &conceallevel
let g:indentLine_concealcursor = &concealcursor

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" vim-markdown-preview
" By default, <C-p> to activate preview
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Safari'

" }}}

vim:fdm=marker
