
myPlugins=(\
        zsh-autosuggestions \
        z \
        battery \
        systemd \
        docker \
        docker-compose \
        zsh-dircolors-solarized )

# Load all of the myPlugins 
for plugin ($myPlugins); do
  if [ -f $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh ]; then
    source $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh
  elif [ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then
    source $ZSH/plugins/$plugin/$plugin.plugin.zsh
  fi
done

ZSH_THEME="agnoster"
DISABLE_AUTO_UPDATE="true"

export GIT_EDITOR=/usr/bin/vim
export EDITOR=/usr/bin/vim
export VISUAL=$EDITOR

[[ -d /usr/local/go/bin ]] && export PATH=$PATH:/usr/local/go/bin
[[ -d ~/go/bin ]] && export PATH=$PATH:~/go/bin
[[ -d ~/bin ]] && export PATH=$PATH:~/bin


[[ -f ~/.zprofile ]] && source ~/.zprofile

# To bind ctrl-space to accept autosuggest
bindkey '^ ' autosuggest-accept

if [[ $(alias z | wc -w) == 2 ]]
then
	alias j='_z 2>&1'
fi