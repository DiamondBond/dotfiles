set nocompatible              " be iMproved, required
filetype off                  " required
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set line counter
set number

" Set to auto read when a file is changed from the outside
set autoread

" Turn on the Wild menu
set wildmenu

"Always show current position
set ruler

" Ignore case when searching
set ignorecase

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Turn backup off
set nobackup
set nowb
set noswapfile

" Smart tabs
set smarttab

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Mouse scroll
set mouse=a

" Syntax
syntax on

" Backspace everything
set backspace=indent,eol,start
