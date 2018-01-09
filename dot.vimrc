" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
 
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.
 
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
 
" Enable syntax highlighting
syntax on

" Must have options {{{1
"
" These are highly recommended options.
 
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden
 
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall
 
" Better command-line completion
set wildmenu
 
" Show partial commands in the last line of the screen
set showcmd
 
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
 
" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline

" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4

" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" User options {{{1
"
" Use ":help 'option'" to see what each option does. For example,
" ":help 'encoding'".

set encoding=utf-8
set sessionoptions=resize,winpos,folds,winsize
set lazyredraw
set listchars=tab:▸\ ,eol:¬
set breakindent
set linebreak
set showmatch
set incsearch
set nohlsearch

" Personal LaTeX coding style
autocmd filetype tex setlocal noet sts=4 sw=4 tw=0 cc=0

" Adopt Linux kernel coding style
" URL: https://www.kernel.org/doc/Documentation/process/coding-style.rst
autocmd filetype c setlocal noet sts=8 sw=8 tw=80 cc=81

" Google HTML/CSS style guide
" URL: https://google.github.io/styleguide/htmlcssguide.html
autocmd filetype html,css setlocal et sts=2 sw=2 tw=0 cc=0

" Airbnb JavaScript style guide
" URL: https://github.com/airbnb/javascript
autocmd filetype javascript setlocal et sts=2 sw=2 tw=100 cc=101

" Ruby on Rails coding conventions
" URL: http://guides.rubyonrails.org/contributing_to_ruby_on_rails.html
autocmd filetype ruby setlocal et sts=2 sw=2 tw=0 cc=0

" Coding conventions found in POSIX shell document
" URL: http://pubs.opengroup.org/onlinepubs/009695399/utilities/xcu_chap02.html
autocmd filetype sh setlocal et sts=4 sw=4 tw=80 cc=81

" tpope: A Note About Git Commit Messages
" URL: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
autocmd filetype gitcommit setlocal spell et sts=2 sw=2 tw=72 cc=73

" Personal C++ coding style
" URL: http://isocpp.github.io/CppCoreGuidelines
autocmd filetype cpp setlocal et sts=4 sw=4 tw=80 cc=81

" Coding conventions found in official Docker images
autocmd filetype dockerfile setlocal noet sts=8 sw=8 tw=0 cc=0

" Personal Markdown coding style
autocmd filetype markdown setlocal spell et sts=2 sw=2 tw=80 cc=81

" Personal VHDL and SystemVerilog style
autocmd filetype verilog,vhdl setlocal et sts=4 sw=4 tw=80 cc=81

" OCaml Programming Guidelines
" URL: https://ocaml.org/learn/tutorials/guidelines.html
autocmd filetype ocaml setlocal noet sts=8 sw=8 tw=80 cc=81

" Style Guide for Python Code
" URL: https://www.python.org/dev/peps/pep-0008/
autocmd filetype python setlocal et sts=4 sw=4 tw=79 cc=73,80

" Personal Prolog coding style
autocmd filetype prolog setlocal et sts=4 sw=4 tw=80 cc=81

" Code Conventions for the Java Programming Language
" URL: http://web.archive.org/web/20090904195252/http://java.sun.com/docs/codeconv/index.html
autocmd filetype java setlocal et sts=4 sw=4 tw=80 cc=81

" MediaWiki coding conventions
" URL: https://www.mediawiki.org/wiki/Manual:Coding_conventions
autocmd filetype php setlocal noet sts=4 sw=4 tw=80 cc=81
