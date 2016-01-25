set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'easymotion/vim-easymotion'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jwalton512/vim-blade'
Plugin 'scrooloose/nerdcommenter'
Plugin 'flazz/vim-colorschemes'

call vundle#end() " required
filetype plugin indent on " required

let mapleader=","

set showmode		" always show mode
set laststatus=2	" always show status line
set tabstop=4		" a tab is four spaces
set nowrap			" don't wrap lines
set backspace=indent,eol,start		"allow backspacing over everything in insert mode
set autoindent		" alwys set autoindenting on
set copyindent		" copy the previous indentation on autoindenting
set number			" always show line numbers
set numberwidth=5	" we're good up to 99999 lines
set shiftwidth=4	" number of spaes to use for autoindenting is four spaces
set shiftround		" use multiple of shiftwidth when indenting with '<' and '>'
set showmatch		" show matching parenthesis
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search patter is all lowercase, case-sensitive otherwise
set smarttab		" insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch		" highlight search terms
set incsearch		" show search matches as you type
set wrapscan		" wrap searches and end of scan
set history=1000	" remember more commands and search history
set undolevels=1000	" use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title			" change the terminal's title
set visualbell		" don't beep
set noerrorbells	" don't beep
set confirm			" raise dialog asking to save if needed
set scrolloff=50	" number of lines above and below cursors
set showcmd			" show command in corner as written
set wildmenu		" show list of matches above command line when invoking completion
set nocursorline
set pastetoggle=<F2>
set nobackup
set noswapfile
set autoread
set autowrite
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
if has('mouse')
  set mouse=a
endif

set encoding=utf-8      " necessary to show unicode glyphs

set t_Co=256		" give me colors!
" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
    set t_Co=16
endif

if &t_Co >= 256 || has("gui_running")
	set background=dark
	colorscheme candyman
endif

if &t_Co > 2 || has("gui_running")
	" switch syntax highlighting on, when the terminal has colors
	syntax on
endif

" Open MacVim in fullscreen mode
if has("gui_macvim")
    set guioptions=maxvert,maxhorz
    " au GUIEnter * set fullscreen
endif

if has("gui_running")
	set guifont=Source\ Code\ Pro:h18
	set linespace=6
endif

"""""""""""""""""""""""""""""
" CONVENIENCE FUNCTIONS
"""""""""""""""""""""""""""""
if filereadable(expand("~/.vimrc.convenience"))
    source ~/.vimrc.convenience
endif

imap jk <ESC>
nmap H ^
nmap L $

map <Down> gj
map <Up> gk
nnoremap j gj
nnoremap k gk

" switch tabs quickly with Shift-J/Shift-K
nnoremap J gT
nnoremap K gt

" quickly switch windows
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

"toggle numbers!
nnoremap <silent> <F6> :set number!<cr>

" quickly edit/source vim file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" quickly move lines up/down (awesome)
nmap <C-j> mz:m+<cr>`z
nmap <C-k> mz:m-2<cr>`z
vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

" spell checking toggle
map <leader>ss :setlocal spell!<cr>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" set current directory to open file's directory
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" NERDTree
nmap <leader>b :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" CtrlP
nnoremap <silent> t :CtrlP<cr>
let g:ctrlp_working_path_mode = 2
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 600
let g:ctrlp_max_depth = 5

