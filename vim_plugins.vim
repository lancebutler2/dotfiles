filetype off

set rtp+=~/.vim/bundle/Vundle.vim		" add vundle to the run-time path
call vundle#begin()						" tell vundle to do its thing

"-------------------------------------------------"
"-----------VUNDLE PLUGINS-----------------"
Plugin 'VundleVim/Vundle.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'vim-airline/vim-airline'
Plugin 'gmist/vim-palette'
Plugin 'tpope/vim-vinegar'
Plugin 'easymotion/vim-easymotion'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'jwalton512/vim-blade'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'tacahiroy/ctrlp-funky'
Plugin 'ivalkeen/vim-ctrlp-tjump'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'vim-scripts/ZoomWin'
Plugin 'rking/ag.vim'
Plugin 'skwp/greplace.vim'
Plugin 'jdkanani/vim-material-theme'


call vundle#end() 						" thanks for doing your thing vundle!
filetype plugin indent on 				" plugin indent on
