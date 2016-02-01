set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"-------------------------------------------------"
"-----------VUNDLE PLUGINS-----------------"
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'easymotion/vim-easymotion'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jwalton512/vim-blade'
Plugin 'scrooloose/nerdcommenter'
Plugin 'flazz/vim-colorschemes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'ivalkeen/vim-ctrlp-tjump'
Plugin 'mattn/emmet-vim'

call vundle#end() " required
filetype plugin indent on " required


"-------------------------------------------------"
"-----------SETTINGS-----------------"
let mapleader=","
set showmode		" always show mode
set laststatus=2	" always show status line
set tabstop=4		" a tab is four spaces
set nowrap			" don't wrap lines
set backspace=indent,eol,start		"allow backspacing over everything in insert mode
set autoindent		" always set auto-indenting on
set copyindent		" copy the previous indentation on auto-indenting
set number			" always show line numbers
set numberwidth=5	" we're good up to 99999 lines
set shiftwidth=4	" number of spaces to use for auto-indenting is four spaces
set shiftround		" use multiple of shift width when indenting with '<' and '>'
set showmatch		" show matching parenthesis
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search patter is all lowercase, case-sensitive otherwise
set smarttab		" insert tabs on the start of a line according to shift width, not tabstop
set hlsearch		" highlight search terms
set incsearch		" show search matches as you type
set wrapscan		" wrap searches and end of scan
set history=1000	" remember more commands and search history
set undolevels=1000	" use many levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title			" change the terminal's title
set visualbell		" don't beep
set noerrorbells	" don't beep
set confirm			" raise dialog asking to save if needed
set scrolloff=3		" number of lines above and below cursors
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
	colorscheme atom-dark-256
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


"-------------------------------------------------"
"-----------CONVENIENCE FUNCTIONS-----------------"
if filereadable(expand("~/.vimrc.convenience"))
    source ~/.vimrc.convenience
endif


"------------------------------------"
"-----------MAPPINGS-----------------"

"-----------Movement-----------------"
inoremap jk <ESC>
nmap H ^
nmap L $
map <Down> gj
map <Up> gk
nnoremap j gj
nnoremap k gk

"-----------Windows and Tabs-----------------"
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
nmap <leader>tn :tabn<cr>
nmap <leader>tp :tabp<cr>
nnoremap J gT
nnoremap K gt

"-----------Utility-----------------"
nmap <silent>; :
nmap <silent> <F6> :set number!<cr>
nmap <leader>cd :cd %:p:h<cr>:pwd<cr>
nmap <C-j> mz:m+<cr>`z
nmap <C-k> mz:m-2<cr>`z
vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

"-----------Vim File Editing-----------------"
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"-----------Spellchecking-----------------"
map <leader>ss :setlocal spell!<cr>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
map <leader><space> :nohlsearch<cr>


"------------------------------------"
"-----------NERDTREE-----------------"
let NERDTreeHighlightCursorline=1
nmap <leader>b :NERDTreeToggle<CR>
nmap <silent><leader><leader>fis :NERDTreeFind<cr>


"--------------------------------------"
"-----------SYNSTASTIC-----------------"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"---------------------------------"
"-----------CTRLP-----------------"
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 500
let g:ctrlp_max_depth = 40
let g:ctrlp_match_window = 'top,order:ttb,min:999,max:999,results:999'
let g:ctrlp_jump_to_buffer = 2
let g:ctrlp_highlight_match = [1, 'Identifier']
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_show_hidden = 1
let g:ctrlp_funky_syntax_highlight = 1
nmap <leader>p :CtrlP<cr>
nmap <leader>e :CtrlPMRUFiles<cr>
nmap <leader>r :CtrlPFunky<cr>
nmap <leader>t :CtrlPtjump<cr>

"---------------------------------------"
"------------Airline--------------"

"---------------------------------------"
"------------Emmet--------------"
let g:user_emmet_mode='a'		"enable in all modes
nmap <leader>ee :Emmet<space>


"---------------------------------------"
"------------Auto-commands--------------"
"Automatically source vimrc on save
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
