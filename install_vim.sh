#!/bin/bash

_gitdir=$(readlink -f "$(dirname "$0")/..")
which nvim > /dev/null && _nvim_installed=yes

if [[ -z $_nvim_installed ]]
then
    # NeoVim not installed
    echo NeoVim not installed 
    ln -s "${_gitdir}"/vim/.config/nvim/init.vim ~/.vimrc
fi
