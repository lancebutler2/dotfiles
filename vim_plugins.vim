filetype off

set rtp+=~/.vim/bundle/Vundle.vim		" add vundle to the run-time path
call vundle#begin()						" tell vundle to do its thing

"-------------------------------------------------"
"-----------VUNDLE PLUGINS-----------------"
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'easymotion/vim-easymotion'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jwalton512/vim-blade'
Plugin 'scrooloose/nerdcommenter'
Plugin 'flazz/vim-colorschemes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'ivalkeen/vim-ctrlp-tjump'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'

call vundle#end() 						" thanks for doing your thing vundle!
filetype plugin indent on 				" plugin indent on
