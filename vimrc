set nocompatible

" VUNDLE
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

" CONVENIENCE FUNCTIONS
if filereadable(expand("~/.vimrc.convenience"))
    source ~/.vimrc.convenience
endif

syntax enable
filetype plugin indent on
set background=dark     " dark background
set encoding=utf-8      " necessary to show unicode glyphs

set t_Co=256		" give me colors!
" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
    set t_Co=16
endif
set backspace=indent,eol,start	" allow backspacing over everything in insert mode
set tabstop=8		" keep tabstop at 8 to appear correct for printing
set softtabstop=4	" 4 spaces for tab during coding
set shiftwidth=4	" 4 spaces for tab during coding
set shiftround          " use multiple of tab when shifting
set expandtab		" spaces are better than tab character
set smarttab		" spaces are better than tab character
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set noshowmode		" showmode
set laststatus=2        " always show status line
set incsearch		" do incremental searching
set mouse=a		" enable mouse for all modes
set mousehide		" hide mouse while typing
set wrapscan		" set wrap searches
set ignorecase		" case insensitive searching
set smartcase		" case sensitive when uc present
set wildmenu		" display wildmenu instead of just completing it
set wildmode=list:longest,full	" Command <Tab> completion, list matches, then longest common part, then all.
set scrolljump=5	" Lines to scroll when cursor leaves screen
set scrolloff=3		" Minimum lines to keep above and below cursor
set nowrap		" set wrap for all files
set number		" set numbers
set backup		" keep a backup file
set backupdir=~/.vim/backup " backup dir
set directory=~/.vim/tmp    " directory?
set autoindent		" autoindent next line to match above one
set tabpagemax=15	" change tabpagemax
set nolist		" start out by setting nolist, do not show special tab/space characters, etc
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.	" Highlight problematic whitespace
set splitright		"  Puts new vsplit windows to the right of the current
set splitbelow		" Puts new split windows to the bottom of the current
set pastetoggle=<F12>	" pastetoggle (sane indentation on pastes)
set viewoptions=folds,options,cursor,unix,slash	" Better Unix / Windows compatibility
set virtualedit=onemore	" Allow for cursor beyond last character
set history=1000	" Store a ton of history (default is 20)
set hidden		" Allow buffer switching without saving
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
set linespace=4		" set linespacing for gvim
set hlsearch            " hilight things that we find with search
set guioptions-=T	" remove toolbar for gui
set guioptions-=r	" remove right hand scroll bar for gui
set guioptions-=L       " remove left hand scroll bar for gui
set confirm             " instead of failing command, raise dialog asking to save changed files
set visualbell          " use visual bell instead of beeping when doing something wrong
set notimeout ttimeout ttimeoutlen=200  " quickly time out on keycodes, but never time out on mappings
" set pastetoggle=<F11>   " use <F11> to toggle between 'paste' and 'nopaste'

" MAPS
let mapleader = ","
inoremap <C-U> <C-G>u<C-U>
inoremap jk <ESC>
nnoremap j gj
nnoremap k gk
nnoremap H ^
nnoremap L $
nnoremap J gT
nnoremap K gt
" nnoremap <F5> :NERDTreeToggle<cr>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <silent> <F6> :set number!<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>f :FufFile<cr>
nnoremap <leader>t :tabnew \| :FufFile<cr>
nnoremap <leader>d :FufDirWithCurrentBufferDir<cr>
nnoremap <leader>b :FufBuffer<cr>
nnoremap <leader>w :call Wipeout()<Esc>
nnoremap s <Plug>(easymotion-s)
nnoremap <C-l> :nohl<cr><C-l>
let g:airline_powerline_fonts=1

" AUTOCOMMANDS
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif " remove any trailing whitespace that is in the file

" GLOBAL MAPS
let g:fuf_maxMenuWidth=950
let g:airline#extensions#tabline#enabled=1

" COLOR SCHEME
colorscheme candyman
let g:Powerline_symbols = 'fancy'
