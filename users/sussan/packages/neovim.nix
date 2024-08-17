
{ config, lib, pkgs, pkgs-unstable, ... }:

{
  imports = [];

  options = {};

  config = {

    programs = {
      neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
        plugins = with pkgs.vimPlugins; [
          LazyVim
        ];
      };
    };

    home = {
      packages = with pkgs; [
        lazygit
        rust-analyzer
      ] ++ (
        with pkgs-unstable; []
      );
      file = {
      	# ".config/neovim".source = ./dotfiles/.config/neovim;
      };
    };
  };
}
