# Utility
alias cls='clear'
alias :q='exit'

# LS commands
alias ll='ls -lF'
alias ls='ls -F'
alias la='ls -a1'
alias vm='homestead ssh'

# Git
alias gl='git log --oneline --graph'
alias gst='git status'
alias gstatus='git status'
alias gmmaster='git merge master'
alias gpstaging='git push staging staging'
alias gpproduction='git push production production'
alias gchmaster='git checkout master'
alias gchstaging='git checkout staging'
alias gchproduction='git checkout production'
alias gyolo='gchstaging && gmmaster && gpstaging && gchproduction && gmmaster && gpproduction && gchmaster'

# Composer
alias compda='composer dumpautoload -o'
