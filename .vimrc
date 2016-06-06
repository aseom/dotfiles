" Settings {{{
" ============

syntax on
set nocompatible
set mouse=a                     " Use mouse
set backspace=indent,eol,start  " Use backspace

set scrolloff=3
set nowrap
set nofoldenable        " `zc` to fold
set clipboard+=unnamed  " Use clipboard register '*' by default
set splitright          " Split to right when `:vs`
set splitbelow          " Split to below when `:sp`

" Visual
set title         " Show window title
set number        " Show line numbers
set cursorline    " Highlight current line
set laststatus=2  " Always show status bar
set ruler         " Show scroll percentage
set noshowmode
set showcmd
set showmatch  " Highlight brackets

" Indent
set autoindent
set expandtab  " Convert tabs to spaces
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
if has('gui_macvim')
    set guifont=Menlo\ for\ Powerline:h14
    set linespace=1
    set guioptions-=L

    " Use Gureum IM if not work properly
    set noimdisable  " Auto change input source to english
    set iminsert=1   " Don't change when insert enter
    set imsearch=-1
endif

" NERDTree + Startify
autocmd VimEnter * if !argc() &&
    \ exists(':Startify') && exists(':NERDTree') | Startify | NERDTree | endif

" Quit vim if NERDTree is only window
autocmd WinEnter * if winnr('$') == 1 && &ft == 'nerdtree' | q | endif

" }}}

" Keymaps, Commands {{{
" =====================

" Use `:help index` to see the default key bindings
" Split window: <C-w>s or <C-w>v

" Key combination timeout (ms)
set timeoutlen=300

" If autocompletion popup visable, <Tab> to select next item
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"

" Save, quit
nnoremap <silent> <C-s>      :update<CR>
inoremap <silent> <C-s> <ESC>:update<CR>
nnoremap <silent> q :confirm q<CR>
nnoremap <silent> Q :confirm q<CR>

" Use buffer instead of tab
nnoremap <silent> H :bNext<CR>
nnoremap <silent> L :bprevious<CR>

" Delete buffer without closing window
function! s:delete_buffer()
    if &modified | echom 'No write since last change!' | return | endif
    " Find all windows that show current buffer (%: curr, #: prev, $: last)
    for winnum in filter(range(1, winnr('$')), 'winbufnr(v:val) == bufnr("%")')
        execute winnum.'wincmd w'
        execute buflisted(bufnr('#')) ? 'buffer #' : 'enew'
    endfor
    silent! bdelete #  " Ignore 'No buffer were deleted'
endfunction
nnoremap <silent> <C-c> :call <SID>delete_buffer()<CR>

" Undo, redo, paste
" Use `[p` to paste and adjust indent
nnoremap <C-z>      u
inoremap <C-z> <C-o>u
nnoremap <C-y>      <C-r>
inoremap <C-y> <C-o><C-r>
nnoremap <C-v>      p
inoremap <C-v> <C-o>p

" Keep clipboard when pasting
vnoremap p     "0dP
vnoremap <C-v> "0dP

" Paste in newline
nnoremap <silent> pp :put<CR>

" Easy indent
nnoremap <Tab>   >>
nnoremap <S-Tab> <<
vnoremap > >gv
vnoremap < <gv

" Add newline + ESC
nnoremap <CR> o<ESC>

" Clear search highlight
nnoremap <silent> <C-l> :nohlsearch<CR>

" Open NERDTree
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

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
Plug 'tomasr/molokai'
Plug 'itchyny/lightline.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify'
Plug 'ap/vim-buftabline'
Plug 'jiangmiao/auto-pairs'

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
try
    if has('gui_macvim')
        colorscheme cake16
        hi Normal       guifg=#484040 guibg=#fffdfa
        hi CursorLine   guifg=NONE    guibg=#f6f4eb
        hi CursorLineNr guifg=NONE    guibg=#f6f4eb
        hi ColorColumn  guifg=NONE    guibg=#f0f0e8
    else
        let g:rehash256 = 1
        colorscheme molokai
    endif
catch 'Cannot find color scheme'
    colorscheme default
endtry

" lightline
let g:lightline = {
    \   'colorscheme': 'wombat',
    \   'active': {
    \     'left':  [['mode'], ['filename']],
    \     'right': [['lineinfo'], ['percent'], ['fileinfo']]
    \   },
    \   'component_function': {
    \     'filename': 'LightlineFilename',
    \     'fileinfo': 'LightlineFileinfo'
    \   },
    \   'separator': { 'left': "\ue0b0", 'right': "\ue0b2" }
    \ }

function! LightlineFilename()
    let filename = ''
    if exists('*fugitive#head')
        let branch = fugitive#head()
        let filename .= branch != '' ? "\ue0a0 ".branch." \ue0b1 " : ''
    endif
    let filename .= &readonly ? "\ue0a2 \ue0b1 " : ''
    let filename .= expand('%:t') != '' ? expand('%:t') : '[No Name]'
    let filename .= &modified ? ' *' : ''
    return filename
endfunction

function! LightlineFileinfo()
    let fileinfo = ''
    if winwidth(0) > 70
        let fileinfo .= &filetype
        let fileinfo .= &fileformat != ''   ? " \ue0b3 ".&fileformat   : ''
        let fileinfo .= &fileencoding != '' ? " \ue0b3 ".&fileencoding : ''
    endif
    return fileinfo
endfunction

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
let NERDTreeIgnore = ['^\.DS_Store$', '^\.Trash$', '\.swp$']
let NERDTreeChDirMode = 2  " Auto change CWD

"syntastic
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_stl_format = "Syntax:%F (%t)"
let g:syntastic_javascript_checkers = ['eslint']

" Fugitive
" Use `:Gwrite` instead of `git add`
" Reference: http://vimcasts.org/categories/git/
function! s:on_fugitive()
    nnoremap <buffer> <C-g>  :Gstatus<CR>
    nnoremap <buffer> <C-g>g :Git
endfunction
autocmd User Fugitive call s:on_fugitive()

" Let fugitive resolve symlink when opening file
function! s:fugitive_resolve_symlink()
    let path     = expand('%:p')
    let realpath = resolve(path)
    if path != realpath && exists('*fugitive#detect')
        call fugitive#detect(realpath)
    endif
endfunction
autocmd BufReadPost * call <SID>fugitive_resolve_symlink()

" indentLine
let g:indentLine_color_gui = "#ede4d4"
" https://github.com/Yggdroot/indentLine/issues/109
let g:indentLine_conceallevel  = &conceallevel
let g:indentLine_concealcursor = &concealcursor

" buftabline
let g:buftabline_show = 1  " if at least two buffers
let g:buftabline_numbers = 2
let g:buftabline_indicators = 1

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" vim-markdown-preview
" By default, <C-p> to activate preview
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Safari'

" }}}

" vim:fdm=marker
