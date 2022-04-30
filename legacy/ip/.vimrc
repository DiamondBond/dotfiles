" Set compatibility to Vim only.
set nocompatible

" Line numbers
"set number

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

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Alloq color schemes to do bright colors without forcing bold
set t_Co=16

" no visual bell
set t_vb=

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

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif


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

" Tab Nav
map <C-t>t :tabnew<cr>
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>
map <F12> :set invnumber<cr>

noremap <C-p> :GFiles<CR>
