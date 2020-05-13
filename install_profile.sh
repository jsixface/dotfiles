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
fi


