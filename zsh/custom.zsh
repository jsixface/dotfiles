# Load all these plugins 
#   - This way we don't have to edit ~/.zshrc after every install

myPlugins=(\
        zsh-autosuggestions \
        z \
        systemd \
        docker \
        docker-compose \
        zsh-dircolors-solarized )

for plugin ($myPlugins); do
  if [ -f $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh ]; then
    source $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh
  elif [ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then
    source $ZSH/plugins/$plugin/$plugin.plugin.zsh
  fi
done

ZSH_THEME="agnoster"
DISABLE_AUTO_UPDATE="true"

export EDITOR=$(which nvim 2>/dev/null) 
[[ -z $EDITOR ]] && export EDITOR=$(which vi)

export GIT_EDITOR=$EDITOR
export VISUAL=$EDITOR

[[ -d /usr/local/go/bin ]] && export PATH=$PATH:/usr/local/go/bin
[[ -d ~/go/bin ]] && export PATH=$PATH:~/go/bin
[[ -d ~/bin ]] && export PATH=$PATH:~/bin


[[ -f ~/.local/zprofile ]] && source ~/.local/zprofile

# To bind ctrl-space to accept autosuggest
bindkey '^ ' autosuggest-accept


### Re-assign 'z' to 'j' because j is easy to type with index finger and analogous for 'jump'
if [[ $(alias z | wc -w) == 2 ]]
then
	alias j='_z 2>&1'
fi