set nocompatible						" do not use vi settings if applicable

so ~/.vim_plugins.vim					" load plugins using Vundle

syntax enable
set background=dark
colorscheme candyman
set guifont=Ubuntu\ Mono\ 14

"-------------------------------------------------"
"-----------SETTINGS-----------------"
let mapleader=","

if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin"
    set macligatures  "fancy arrows and stuff
  endif
endif

set showmode							" always show mode
set laststatus=2						" always show status line
set tabstop=2							" a tab is two spaces
set expandtab							" insert space characters whenever the tab key is pressed
set nowrap								" don't wrap lines
set backspace=indent,eol,start			" allow backspacing over everything in insert mode
set autoindent							" always set auto-indenting on
set copyindent							" copy the previous indentation on auto-indenting
set number								" always show line numbers
set numberwidth=5						" we're good up to 99999 lines
set shiftwidth=2						" number of spaces to use for auto-indenting is four spaces
set shiftround							" use multiple of shift width when indenting with '<' and '>'
set showmatch							" show matching parenthesis
set ignorecase							" ignore case when searching
set smartcase							" ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab							" insert tabs on the start of a line according to shift width, not tabstop
set hlsearch							" highlight search terms
set incsearch							" show search matches as you type
set wrapscan							" wrap searches and end of scan
set history=1000						" remember more commands and search history
set undolevels=1000						" use many levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title								" change the terminal's title
set visualbell							" don't beep
set noerrorbells						" don't beep
set noconfirm							" raise dialog asking to save if needed
set scrolloff=3							" number of lines above and below cursors
set showcmd								" show command in corner as written
set wildmenu							" show list of matches above command line when invoking completion
set nocursorline						" hide line highlighting that cursor is on
set pastetoggle=<F2>					" toggle to paste in large blocks of code
set nobackup							" backups? we don't need no stinkin backups! git!
set noswapfile							" no swap files either
set autoread							" if an external change occurs, read it
set autowriteall						" if we lose focus, go ahead and save
set splitbelow							" better split position
set splitright							" better split position
set encoding=utf-8      				" necessary to show unicode glyphs
set t_Co=256							" give me colors!
set complete=.,w,b,u                    " set autocomplete to current buffer, other windows, buffers, and unloaded buffers
set completeopt=longest,menuone
set t_vb=

" Border colors and padding
hi LineNr guibg=bg
hi foldcolumn guibg=bg
set foldcolumn=1

" Clean split borders
hi vertsplit guifg=bg guibg=bg

if &t_Co == 8 && $TERM !~# '^linux'
    set t_Co=16		" Allow color schemes to do bright colors without forcing bold.
endif





"-------------------------------------------------"
"-----------FUNCTIONS-----------------"
if filereadable(expand("~/.vim_functions.vim"))
    source ~/.vim_functions.vim 	" add any custom vim functions 
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
nmap <c-h> :vertical resize +5<cr>
nmap <c-l> :vertical resize -5<cr>

"-----------Utility-----------------"
nmap <leader>q :bd<cr>
nmap <silent>; :
nmap <silent> <F6> :set number!<cr>
nmap <leader><leader>trn :set relativenumber!<cr>
nmap <leader>cd :cd %:p:h<cr>:pwd<cr>
nmap <C-j> mz:m+<cr>`z
nmap <C-k> mz:m-2<cr>`z
vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z
nmap <leader><leader>tn :set number!<cr>
nnoremap <leader><leader>tw :set wrap!<cr>


"-----------Vim File Editing-----------------"
nnoremap <leader><leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader><leader>sv :source $MYVIMRC<cr>
nnoremap <leader><leader>es :e ~/.vim/snippets/


"-----------Spellchecking-----------------"
map <leader>ss :setlocal spell!<cr>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
map <leader><space> :nohlsearch<cr>





"------------------------------------"
"-----------NERDTREE-----------------"
let NERDTreeHijackNetrw = 0
let NERDTreeHighlightCursorline = 1
nmap <leader>b :NERDTreeToggle<CR>
nmap <leader><leader>fib :NERDTreeFind<cr>





"------------------------------------"
"-----------TagBar-----------------"
" nmap <leader><leader>b :TagbarToggle<cr>





"--------------------------------------"
"-----------SYNSTASTIC-----------------"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs=1





"---------------------------------"
"-----------CTRLP-----------------"
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'top,order:ttb,min:50,max:50,results:30'
let g:ctrlp_jump_to_buffer = 2
let g:ctrlp_highlight_match = [1, 'Identifier']
let g:ctrlp_show_hidden = 1
nmap <leader>p :CtrlP<cr>
nnoremap <D-p> :CtrlP<cr>
nmap <leader>e :CtrlPMRUFiles<cr>
nmap <D-e> :CtrlPMRUFiles<cr>
nmap <Leader>r :CtrlPBufTag<cr>
nmap <D-e> :CtrlPBufTag<cr>
nmap <leader>t :CtrlPtjump<cr>
nmap <D-t> :CtrlPtjump<cr>





"---------------------------------------"
"------------Airline--------------"





"---------------------------------------"
"------------Emmet--------------"
let g:user_emmet_mode='a'		"enable in all modes
nmap <leader>ee :Emmet<space>






"---------------------------------------"
"------------PHP Complete--------------"
"let g:phpcomplete_index_composer_command='composer'





"---------------------------------------"
"------------ZoomWin--------------"
nmap <silent> <leader>wo :ZoomWin<cr>





"---------------------------------------"
"------------Greplace.vim--------------"
set grepprg=ag

let g:grep_cmd_opts = '--line-numbers --noheading'





"---------------------------------------"
"------------Auto-commands--------------"
"Automatically source vimrc on save
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
