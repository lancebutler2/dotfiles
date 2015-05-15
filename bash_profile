if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi

PATH=$PATH:~/.composer/vendor/bin;
PATH=/usr/local/sbin:$PATH;
export PATH;
