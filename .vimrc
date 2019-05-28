" Set compatibility to Vim only.
set nocompatible

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Turn on syntax highlighting.
syntax on

" For plug-ins to load correctly.
filetype plugin indent on

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

"try
"    colorscheme desert
"catch
"endtry

"set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Misc set;
"set number
set linebreak
set showbreak=+++
set textwidth=100
set showmode
set showcmd
set showmatch
set matchpairs+=<:>
set hlsearch
"set smartcase
set ignorecase
set incsearch
set autoindent
set autowrite
set autoread
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
set ruler
set wrap
set undolevels=1000
set backspace=indent,eol,start
set hidden
" set mouse=a
set ttyfast
"set foldcolumn=1

" Set status line display
"set laststatus=2
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Always show the status line
"set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Call the .vimrc.plug file - remember to run :PlugInstall if firstime
if filereadable(expand("~/.vimrc.plug"))
    source ~/.vimrc.plug
endif

" NERDTreeToggle
map <C-n> :NERDTreeToggle<CR>

" Theme
colorscheme default
set laststatus=2
hi StatusLine ctermfg=0 ctermbg=1 cterm=NONE
"hi StatusLineNC ctermfg=blue ctermbg=red cterm=NONE
hi User1 ctermfg=0 ctermbg=2
hi User2 ctermfg=NONE ctermbg=NONE
hi User3 ctermfg=0 ctermbg=2
hi User4 ctermfg=0 ctermbg=3
set statusline=\                    "
set statusline+=%t                  "
set statusline+=\ %1*\              "
set statusline+=%y                  "
set statusline+=\ %2*\              "
set statusline+=%=                  "
set statusline+=\ %3*\              "
set statusline+=line                "
set statusline+=\                   "
set statusline+=%l                  "
set statusline+=\ %4*\              "
set statusline+=of                  "
set statusline+=\                   "
set statusline+=%L                  "
set statusline+=\                   "
