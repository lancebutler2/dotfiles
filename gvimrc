set guifont=Ubuntu\ Mono\ 14
set shell=zsh\ -i						" set zshell in interactive mode
set mouse=v 								" allow mouse usage in macvim
set linespace=12						" i need more space between lines
set guioptions-=r						" remove gui bars
set guioptions-=R						" remove gui bars
set guioptions-=l						" remove gui bars
set guioptions-=L						" remove gui bars
set guioptions-=e						" make macvim tabs more like terminal tabs
set visualbell
set t_vb=

if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin"
    set macligatures  "fancy arrows and stuff
    macmenu &File.Print key=<nop>
  endif
endif
