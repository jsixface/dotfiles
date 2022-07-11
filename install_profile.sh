#!/bin/bash

_curr_dir=$(readlink -f "$PWD")

[[ -d ~/bin ]] || mkdir ~/bin

ln -vsf "${_curr_dir}/gitconfig" ~/.gitconfig
ln -vsf "${_curr_dir}/ideavimrc" ~/.ideavimrc

cp "${_curr_dir}/dircolors" ~/.dircolors
cp "${_curr_dir}"/bin/* ~/bin/


if command -v zsh &> /dev/null; then
	if [[ ! -d ~/.oh-my-zsh ]] 
	then
		sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
	fi

	ln -vsf "${_curr_dir}"/zsh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh 
	ln -vsf "${_curr_dir}"/zsh/zshrc ~/.zshrc
	git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions
	git clone --recursive https://github.com/joel-porquet/zsh-dircolors-solarized "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-dircolors-solarized
fi


echo " 
The zsh-dircolors-solarized plugin offers two commands:

'lssolarized' which lists the available solarized themes. For now there are:
	dircolors.ansi-universal (universal theme for 16- and 256-color terminals)
	dircolors.ansi-dark (optimized version of universal for dark background)
	dircolors.ansi-light (optimized version of universal for light background)
	dircolors.256dark (degraded solarized dark theme)
	
'setupsolarized' which installs a theme and saves the current configuration to the configuration file ($HOME/.zsh-dircolors.config by default). 
Without any argument, setupsolarized will use the theme dircolors.ansi-universal.
"

# Install the dot config stuff
[[ -d ~/.config ]] || mkdir ~/.config
cd ~/.config || exit 1
for entry in "${_curr_dir}"/dot_config/* ; do
	ln -vsf "${entry}" 
done

if [[ "$(uname)" = "Darwin" ]]; then 
	mkdir -p "$HOME/Library/Application Support/VSCodium/User"
	ln -s "$_curr_dir/vscode-mac"/keybindings.json "$HOME/Library/Application Support/VSCodium/User"/keybindings.json
	ln -s "$_curr_dir/vscode-mac"/settings.json "$HOME/Library/Application Support/VSCodium/User"/settings.json
fi

cd "${_curr_dir}"