
export GIT_EDITOR=/usr/bin/vim
export EDITOR=/usr/bin/vim
export VISUAL=$EDITOR

[[ -d /usr/local/go/bin ]] && export PATH=$PATH:/usr/local/go/bin
[[ -d ~/go/bin ]] && export PATH=$PATH:~/go/bin

# To bind ctrl-space to accept autosuggest
bindkey '^ ' autosuggest-accept

