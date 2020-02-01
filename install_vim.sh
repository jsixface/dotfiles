#!/bin/bash

cd "`dirname $0`"
_gitdir=`pwd -P`

[[ -d ~/.config ]] || mkdir ~/.config
ln -sf ${_gitdir}/vims ~/.config/nvim

which nvim > /dev/null && _nvim_installed=yes

if [[ -z $_nvim_installed ]]
then
    # NeoVim not installed
    echo NeoVim not installed 
    ln -s ${_gitdir}/vims/init.vim ~/.vimrc
fi


