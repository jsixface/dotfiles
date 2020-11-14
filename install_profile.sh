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
	git clone --recursive https://github.com/joel-porquet/zsh-dircolors-solarized ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-dircolors-solarized
	pos=$(grep -n ^plugins= ~/.zshrc | cut -d : -f 1)
	sed -i "${pos}a\plugins+=(zsh-autosuggestions z zsh-dircolors-solarized)" ~/.zshrc
fi


if [[ ! -d ~/.fzf ]]
then
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
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

