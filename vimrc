set nocompatible    " disable vi-compatibility

"""""""""""""""""""""""""""""
" VUNDLE
"""""""""""""""""""""""""""""
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

syntax enable
filetype plugin indent on

"""""""""""""""""""""""""""""
" CONVENIENCE FUNCTIONS
"""""""""""""""""""""""""""""
if filereadable(expand("~/.vimrc.convenience"))
    source ~/.vimrc.convenience
endif

"""""""""""""""""""""""""""""""""""
" OPTIONS
"""""""""""""""""""""""""""""""""""
colorscheme candyman
set background=dark     " dark background
set encoding=utf-8      " necessary to show unicode glyphs

set t_Co=256		" give me colors!
" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
    set t_Co=16
endif

set guioptions-=T	        " remove toolbar for gui
set guioptions-=r	        " remove right hand scroll bar for gui
set guioptions-=L           " remove left hand scroll bar for gui
set guioptions-=m           " remove menu bar for gui
set guifont=Consolas\ 14

set showmode                " always show what mode we're editing in
set backspace=indent,eol,start	" allow backspacing over everything in insert mode
set tabstop=4		        " keep tabstop at 8 to appear correct for printing
set softtabstop=4	        " when hitting <BS>, pretend like a tab is removed, even if spaces
set shiftwidth=4	        " number of spaces to use for autoindenting
set shiftround              " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab		        " spaces are better than tab character
set smarttab		        " spaces are better than tab character
set history=50		        " keep 50 lines of command line history
set showcmd		            " display incomplete commands
set ruler		            " show the cursor position all the time
set noshowmode		        " show mode
set laststatus=2            " always show status line
set incsearch		        " do incremental searching
set mouse=a		            " enable mouse for all modes
set mousehide		        " hide mouse while typing
set wrapscan		        " set wrap searches
set ignorecase		        " case insensitive searching
set smartcase		        " case sensitive when uc present
set wildmenu		        " display wild menu instead of just completing it
set wildmode=list:longest,full	" Command <Tab> completion, list matches, then longest common part, then all.
set scrolljump=5	        " lines to scroll when cursor leaves screen
set scrolloff=50   	        " minimum lines to keep above and below cursor
set wrap		            " wrap lines
set linebreak               " soft-wrap full words
set number		            " always show line numbers
set numberwidth=5           " we are good up to 99999 lines
set backup		            " keep a backup file
set backupdir=~/.vim/backup " backup dir
set directory=~/.vim/tmp    " directory?
set autoindent		        " autoindent next line to match above one
"set copyindent              " copy the previous indentation on autoindenting
set tabpagemax=15	        " change tabpagemax
set nolist		            " start out by setting nolist, do not show special tab/space characters, etc
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.	" Highlight problematic whitespace
set splitright		        "  puts new vsplit windows to the right of the current
set splitbelow		        " puts new split windows to the bottom of the current
set pastetoggle=<F12>       " pastetoggle (sane indentation on pastes)
set viewoptions=folds,options,cursor,unix,slash	" Better Unix / Windows compatibility
set history=1000	        " store a ton of history (default is 20)
set virtualedit=onemore	    " allow for cursor beyond last character
set hidden		            " allow buffer switching without saving
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
set linespace=15		    " set linespacing for gvim
set hlsearch                " highlight things that we find with search
set confirm                 " instead of failing command, raise dialog asking to save changed files
set novisualbell            " don't beep
set notimeout ttimeout ttimeoutlen=200  " quickly time out on keycodes, but never time out on mappings
" set timeout timeoutlen=200 ttimeoutlen=250
set autoread                " set to auto read when a file is changed from the outside
set autowrite               " save on buffer switch
" set pastetoggle=<F11>     " use <F11> to toggle between 'paste' and 'nopaste'

""""""""""""""""""""""""""""""""""""""""""
" MAPS
""""""""""""""""""""""""""""""""""""""""""
" set <leader>
let mapleader = ","
let g:mapleader = ","

" not sure set
inoremap <C-U> <C-G>u<C-U>

" quickly get back to normal mode
inoremap jk <ESC>

" treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

" quickly get to beggining and end of line
nnoremap H ^
nnoremap L $

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

" fuzzyfinder open file/tab/directory,buffer, and Wipeout the leftovers
" (unused)
nnoremap <leader>f :FufFile<cr>
nnoremap <leader>t :tabnew \| :FufFile<cr>
nnoremap <leader>d :FufDirWithCurrentBufferDir<cr>
nnoremap <leader>b :FufBuffer<cr>
nnoremap <leader>w :call Wipeout()<Esc>

" set current directory to open file's directory
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" easymotion plugin search
" nnoremap s <Plug>(easymotion-s)

" redraw screen and remove search underlines/highlighting
nnoremap <leader><leader>l :nohl<cr><C-l>

" find word under cursor in visual mode
vnoremap <silent> * :call VisualSelection('f')<cr>
vnoremap <silent> # :call VisualSelection('b')<cr>

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

" quickly toggle paste mode on/off
map <leader>pp :setlocal paste!<cr>

" powerline fanciness
let g:airline_powerline_fonts=1

" toggle relative numbers
nnoremap <leader>rn :set rnu!<cr>

" toggle NerdTree
nnoremap <silent><F5> :NERDTreeToggle<cr>
" nnoremap <leader>nt :NERDTreeToggle<cr>
nmap <C-b> :NERDTreeToggle<cr>

" WordPress Codex Search
nnoremap <leader>co :Wcodexsearch<CR>

""""""""""""""""""""""""""""""""""""""""
" Autocommands
""""""""""""""""""""""""""""""""""""""""
" remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" setup syntax for wordpress?
autocmd BufEnter *.php :set syn=wordpress

" call wipeout on opening any file
" autocmd BufReadPre,BufNewFile * :call Wipeout()

"""""""""""""""""""""""""""""""""""""""
" GLOBAL MAPS
"""""""""""""""""""""""""""""""""""""""
let g:fuf_maxMenuWidth=950
let g:airline#extensions#tabline#enabled=1
let g:Powerline_symbols = 'fancy'
let g:user_emmet_leader_key= '<C-e>'
let g:airline_left_sep=''
let g:airline_right_sep=''

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<silent><C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-i>"
let g:UltiSnipsJumpBackwardTrigger="<C-u>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" change youtcompletemedefaults
let g:ycm_key_list_select_completion = ['<C-n>', '<Enter>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<S-Enter>', '<Up>']

" PHP.vim
" g:php_syntax_extensions_enabled
" b:php_syntax_extensions_enabled
