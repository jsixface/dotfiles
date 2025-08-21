#!/bin/bash

# Install oh-my-zsh if not already installed
if command -v zsh &> /dev/null; then
    if [[ ! -d ~/.oh-my-zsh && -z "$ZSH" ]]; then
        sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
    fi

    # Install zsh-autosuggestions
    AUTOSUGG_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
    if [[ ! -d "$AUTOSUGG_DIR" || -z "$(ls -A "$AUTOSUGG_DIR")" ]]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions "$AUTOSUGG_DIR"
    fi
fi
