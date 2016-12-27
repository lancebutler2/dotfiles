source ~/antigen.zsh
source ~/.zsh_profile
source ~/.zsh_aliases

# load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen theme robbyrussell

# Load the theme
#antigen theme robbyrussell

# Bundles from the default repo (robbyrussell's oh-my-zsh)
antigen bundle git
antigen bundle command-not-found

# Syntax highlighting bundle
antigen bundle zsh-users/zsh-syntax-highlighting

# Zsh Titles
#antigen bundle jreese/zsh-titles

# Copyright 2015 John Reese
# Licensed under the MIT license
#
# Update terminal/tmux window titles based on location/command

function update_title() {
  # escape '%' in $1, make nonprintables visible
  print -Pn "\e]0;%n@%m: %~\a"
  #a=${(V)1//\%/\%\%}
  #a=$(print -Pn "%20>...>$a" | tr -d "\n")
  #if [[ -n "$TMUX" ]]; then
  #  print -Pn "\ek$a:$2\e\\"
  #elif [[ "$TERM" =~ "xterm*" ]]; then
  #  print -Pn "\e]0;$a:$2\a"
  #fi
}

# called just before the prompt is printed
function _zsh_title__precmd() {
  update_title "zsh" "%20<...<%~"
}

# called just before a command is executed
function _zsh_title__preexec() {
  local -a cmd; cmd=(${(z)1})             # Re-parse the command line

  # Construct a command that will output the desired job number.
  case $cmd[1] in
    fg)	cmd="${(z)jobtexts[${(Q)cmd[2]:-%+}]}" ;;
    %*)	cmd="${(z)jobtexts[${(Q)cmd[1]:-%+}]}" ;;
  esac
  update_title "$cmd" "%20<...<%~"
}

#autoload -Uz add-zsh-hook
#add-zsh-hook precmd _zsh_title__precmd
#add-zsh-hook preexec _zsh_title__preexec

# Tell antigen that you're done.
antigen apply

SAVEHIST=0
HISTFILE=~/.zsh_history
