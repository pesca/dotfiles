" Fonts
if has("gui_macvim")
    set guifont=Consolas:h13
endif

" Encoding
set encoding=utf-8

" Colors
" set cursorline
" highlight CursorLine cterm=none
" highlight CursorLineNR ctermfg=blue
syntax on

" Spaces and tabs
set expandtab
set autoindent
set tabstop=8
set softtabstop=4
set shiftwidth=4
filetype plugin indent on

" Windows
set sessionoptions=resize,winpos,folds,winsize
if has("gui_running")
    set lines=40
    set columns=90
endif

" Buffers
set hidden

" Views
set number
set wildmenu
set lazyredraw
set laststatus=2
set listchars=tab:▸\ ,eol:¬

" Formatting
set textwidth=80
" set colorcolumn=81

" Text columns
set breakindent
set linebreak

" Searching
set showmatch
set ignorecase
set incsearch
set nohlsearch

autocmd filetype tex setlocal sts=4 sw=4 tw=0 cc=0
autocmd filetype c setlocal noet sts=8 sw=8
autocmd filetype html,css setlocal sts=2 sw=2 tw=0 cc=0
autocmd filetype json,javascript setlocal et sts=2 sw=2 tw=0 cc=0
autocmd filetype ruby setlocal sts=2 sw=2
autocmd filetype sh setlocal sts=4 sw=4
autocmd filetype gitcommit setlocal tw=72 cc=73
autocmd filetype cpp setlocal sts=4 sw=4
autocmd filetype dockerfile setlocal noet sts=8 sw=8 ts=8
