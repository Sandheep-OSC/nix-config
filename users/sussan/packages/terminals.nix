{ config, lib, pkgs, pkgs-unstable, ... }:

{
  imports = [];

  options = {};

  config = {

    programs = {
    };

    home = {
      packages = with pkgs; [ kitty alacritty lunarvim wezterm warp-terminal ] ++ (
        with pkgs-unstable; []
      );
      file = {
        ".config/kitty".source = ../dotfiles/.config/kitty;
        ".config/alacritty".source = ../dotfiles/.config/alacritty;
        ".config/wezterm".source = ../dotfiles/.config/wezterm;
        ".config/lvim".source = ../dotfiles/.config/lvim;
        ".config/neovim".source = ../dotfiles/.config/neovim;
      };
    };
  };
}
