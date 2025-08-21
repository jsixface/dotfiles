#!/bin/bash
# This script unlinks the dotfiles that were linked by the old install_profile.sh script.
# It will check if a file is a symlink and points to the expected target before removing it.

set -u # Treat unset variables as an error

_base_dir=$(dirname "$0")
_curr_dir=$(readlink -f "$_base_dir")

# Helper function to safely unlink a symbolic link.
# It checks if the link exists, is a symlink, and points to the correct target.
# Usage: safe_unlink <link_path> <target_path>
safe_unlink() {
    local link_path="$1"
    local target_path="$2"
    # Expand ~ to $HOME
    local expanded_link_path="${link_path/#\~/$HOME}"

    if [ ! -L "$expanded_link_path" ]; then
        if [ -e "$expanded_link_path" ] || [ -d "$expanded_link_path" ]; then
            echo "Skipping $expanded_link_path: it is not a symbolic link."
        else
            # File doesn't exist, which is fine.
            :
        fi
        return
    fi

    local actual_target
    actual_target=$(readlink "$expanded_link_path")
    if [ "$actual_target" == "$target_path" ]; then
        echo "Unlinking $expanded_link_path"
        rm "$expanded_link_path"
    else
        echo "Skipping $expanded_link_path: it points to '$actual_target', not '$target_path'."
    fi
}

echo "Starting uninstall process for old dotfiles..."
echo "Dotfiles directory is assumed to be: $_curr_dir"
echo ""

# List of files to unlink, based on install_profile.sh
safe_unlink "~/.ssh/config" "$_curr_dir/dot_ssh_config"
safe_unlink "~/.gitconfig" "$_curr_dir/dot_gitconfig"
safe_unlink "~/.ideavimrc" "$_curr_dir/dot_ideavimrc"
safe_unlink "~/.tmux.conf" "$_curr_dir/dot_tmux.conf"
safe_unlink "~/.gradle/init.d/local-properties.gradle.kts" "$_curr_dir/dot_gradle_init.d_local-properties.gradle.kts"
safe_unlink "~/.config/ghostty/config" "$_curr_dir/dot_ghostty_config"
safe_unlink "~/.config/git/ignore" "$_curr_dir/dot_config_git_ignore"
safe_unlink "~/.config/nvim" "$_curr_dir/vims"
safe_unlink "~/.zshrc" "$_curr_dir/dot_zshrc"

# Special handling for .finicky.js as it can point to two different files
finicky_link="$HOME/.finicky.js"
if [ -L "$finicky_link" ]; then
    actual_target=$(readlink "$finicky_link")
    if [ "$actual_target" == "$_curr_dir/dot_finicky.js" ] || [ "$actual_target" == "$_curr_dir/dot_finicky-work.js" ]; then
        echo "Unlinking $finicky_link"
        rm "$finicky_link"
    else
        echo "Skipping $finicky_link: it"
    fi
fi
