#!/bin/bash


cd `dirname $0`
_curr_dir=$(pwd -P)

ln -vsf ${_curr_dir}/bashrc ~/.bashrc
ln -vsf ${_curr_dir}/bash_profile ~/.bash_profile
ln -vsf ${_curr_dir}/bash_aliases ~/.bash_aliases


ln -vsf ${_curr_dir}/gitconfig ~/.gitconfig

[[ -d ~/.oh-my-zsh ]] && ln -vsf ${_curr_dir}/zsh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh 
