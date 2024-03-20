{ config, pkgs, ... }:
# To be placed in ~/.config/home-manager/home.nix
{ 
  programs.zsh = {
    autosuggestions.enable = true;
    ohMyZsh = {
      enable = true;
      custom = "~/git/dotfiles/zsh"
    };
  };
}
