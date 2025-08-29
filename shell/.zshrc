# See https://github.com/ohmyzsh/ohmyzsh/blob/master/templates/zshrc.zsh-template

[[ -d /usr/local/go/bin ]] && export PATH="/usr/local/go/bin:$PATH"
[[ -d /opt/homebrew/bin ]] && export PATH="/opt/homebrew/bin:$PATH"
[[ -d $HOME/go/bin ]] && export PATH="$HOME/go/bin:$PATH"
[[ -d $HOME/bin ]] && export PATH="$HOME/bin:$PATH"
[[ -f $HOME/.local/zprofile ]] && source $HOME/.local/zprofile
[[ -z "$ZSH" ]] && export ZSH="$HOME/.oh-my-zsh"
export LC_ALL=en_US.UTF-8

nul=/dev/null
### Completions need to be set before `compinit`
if command -v brew &>$nul ; then
  BREW_PREFIX=$(brew --prefix)
  FPATH="${BREW_PREFIX}/share/zsh/site-functions:${FPATH}"
  [[ -f "${BREW_PREFIX}/opt/ruby/bin/ruby" ]] && export PATH="${BREW_PREFIX}/opt/ruby/bin:$PATH"
fi

HOMEBREW_NO_AUTO_UPDATE=true
zstyle ':omz:update' frequency 60
ZSH_THEME=simple

# Add plugins. The local zprofile might initialize some
plugs=(\
        docker \
        docker-compose \
        git \
        systemd \
        zsh-autosuggestions \
        zsh-dircolors-solarized )

for plug in "${plugs[@]}"; do
  [[ -d $ZSH/plugins/$plug || -d $ZSH/custom/plugins/$plug ]] && plugins+=($plug)
done

command -v fzf &> $nul && plugins+=( fzf )
command -v firewall-cmd &>$nul && plugins+=( firewalld )
command -v systemctl &>$nul && plugins+=( systemd )

source $ZSH/oh-my-zsh.sh

# To bind ctrl-space to accept autosuggest
bindkey '^ ' autosuggest-accept # Ctrl+Space
bindkey '^[[Z' autosuggest-accept # Shift+Space

command -v zoxide &>$nul && eval "$(zoxide init --cmd j zsh)"
export PROMPT="%{$fg[green]%}%D{%H:%M:%S} %{$reset_color%}%{$fg_bold[red]%}♠ %m %{$reset_color%}%{$fg[green]%}%3~ %{$fg_bold[yellow]%}⇒ %{$reset_color%}"
export SUPERUSER_PROMPT='%{$fg_bold[magenta]%}⚡ %n@%m %{$fg[cyan]%}%3~ %{$fg_bold[yellow]%}# %{$reset_color%}'
if [[ $EUID -eq 0 ]]; then
  export PROMPT="$SUPERUSER_PROMPT"
fi

# Set the default editor
export EDITOR=$(command -vp nvim 2> $nul || command -vp vi 2> $nul)
export GIT_EDITOR=$EDITOR
export VISUAL=$EDITOR

if command -v java &> $nul
then
	export JAVA_HOME=$(java -XshowSettings:properties 2>&1 |grep java.home|awk '{print $3}')
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[[ -f $HOME/.shell-aliases ]] && source $HOME/.shell-aliases
[[ -f $HOME/.shell-functions ]] && source $HOME/.shell-functions

