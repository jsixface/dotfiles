#!/bin/bash


cd `dirname $0`
_curr_dir=$(pwd -P)

ln -vsf ${_curr_dir}/bashrc ~/.bashrc
ln -vsf ${_curr_dir}/bash_profile ~/.bash_profile
ln -vsf ${_curr_dir}/bash_aliases ~/.bash_aliases
cp ${_curr_dir}/dircolors ~/.dircolors


ln -vsf ${_curr_dir}/gitconfig ~/.gitconfig

if [[ -d ~/.oh-my-zsh ]] 
then
	ln -vsf ${_curr_dir}/zsh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh 
	ln -vsf ${_curr_dir}/zsh/custom.zsh ~/.oh-my-zsh/custom/custom.zsh
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	pos=$(grep -n ^plugins= ~/.zshrc | cut -d : -f 1)
	sed -i "${pos}a\plugins+=(zsh-autosuggestions z)" ~/.zshrc
fi

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
