#!/bin/bash
_base_dir=$(dirname "$0")
_curr_dir=$(readlink -f "$_base_dir")

_work=n
printf "Is this work? y/[n]:"
read _work

[[ -d ~/bin ]] || mkdir ~/bin
cp -v "${_curr_dir}"/bin/* ~/bin/

# Install SSH config
[[ -d ~/.ssh/config.d ]] || mkdir -p ~/.ssh/config.d
ln -vsf "$_curr_dir/dot_ssh_config" ~/.ssh/config
ln -vsf "${_curr_dir}/dot_gitconfig" ~/.gitconfig
ln -vsf "${_curr_dir}/dot_ideavimrc" ~/.ideavimrc
ln -vsf "${_curr_dir}/dot_tmux.conf" ~/.tmux.conf

if [[ "$_work" == 'y' ]]; then
	ln -vsf "${_curr_dir}/dot_finicky-work.js" ~/.finicky.js
else 
	ln -vsf "${_curr_dir}/dot_finicky.js" ~/.finicky.js
fi

[[ -d ~/.config/ghostty ]] || mkdir -p ~/.config/ghostty
ln -vsf "${_curr_dir}/dot_ghostty_config" ~/.config/ghostty/config

[[ -d ~/.config/git ]] || mkdir -p ~/.config/git
ln -vsf "${_curr_dir}/dot_config_git_ignore" ~/.config/git/ignore

if command -v zsh &> /dev/null; then
	if [[ ! -d ~/.oh-my-zsh && -z "$ZSH" ]]
	then
		sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
	fi
	ln -vsf "${_curr_dir}"/dot_zshrc ~/.zshrc

	AUTOSUGG_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
	if [[ ! -d "$AUTOSUGG_DIR" || -z "$(ls -A "$AUTOSUGG_DIR")" ]]; then
		git clone https://github.com/zsh-users/zsh-autosuggestions "$AUTOSUGG_DIR"
	else
		echo "Directory $AUTOSUGG_DIR is not empty. Skipping clone."
	fi
fi
