#!/bin/bash
_base_dir=$(dirname "$0")
_curr_dir=$(readlink -f "$_base_dir")

[[ -d ~/bin ]] || mkdir ~/bin
cp -v "${_curr_dir}"/bin/* ~/bin/

# Install SSH config
[[ -d ~/.ssh/config.d ]] || mkdir -p ~/.ssh/config.d
ln -vsf "$_curr_dir/dot_ssh_config" ~/.ssh/config
ln -vsf "${_curr_dir}/dot_gitconfig" ~/.gitconfig
ln -vsf "${_curr_dir}/dot_finicky.js" ~/.finicky.js
ln -vsf "${_curr_dir}/dot_ideavimrc" ~/.ideavimrc
ln -vsf "${_curr_dir}/dot_tmux.conf" ~/.tmux.conf

[[ -d ~/.config/ghostty ]] || mkdir -p ~/.config/ghostty
ln -vsf "${_curr_dir}/dot_ghostty_config" ~/.config/ghostty/config

if command -v zsh &> /dev/null; then
	if [[ ! -d ~/.oh-my-zsh && -z "$ZSH" ]]
	then
		sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
	fi
	ln -vsf "${_curr_dir}"/dot_zshrc ~/.zshrc
	git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions
fi
