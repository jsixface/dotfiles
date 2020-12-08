
export GIT_EDITOR=/usr/bin/vim
export EDITOR=/usr/bin/vim
export VISUAL=$EDITOR

[[ -d /usr/local/go/bin ]] && export PATH=$PATH:/usr/local/go/bin
[[ -d ~/go/bin ]] && export PATH=$PATH:~/go/bin
[[ -d ~/bin ]] && export PATH=$PATH:~/bin


[[ -f ~/.zprofile ]] && source ~/.zprofile

# To bind ctrl-space to accept autosuggest
bindkey '^ ' autosuggest-accept

