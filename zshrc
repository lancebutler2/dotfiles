source ~/.zsh_profile
source ~/.zsh_aliases
source ~/.zplug/init.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load theme file
zplug 'dracula/zsh', as:theme

# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh

zplug "wting/autojump", as:plugin

zplug "zdharma/fast-syntax-highlighting", as:plugin

zplug "zsh-users/zsh-completions", as:plugin

zplug "peterhurford/up.zsh", as:plugin

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
#zplug load --verbose
zplug load

SAVEHIST=0
HISTFILE=~/.zsh_history
