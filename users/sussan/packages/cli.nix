
{ config, lib, pkgs, pkgs-unstable, ... }:

{
  imports = [];

  options = {};

  config = {

    programs = {};

    home = {
      packages = with pkgs; [
        fzf
        git
        gcc
        gnumake
        binutils
        pkg-config
        cmake
        python312
        nodejs_20
        cargo
        rustc
        unzip
        xclip
        lua
        ollama
        kdePackages.kate
        wget
        curl
      ] ++ (
        with pkgs-unstable; [
          neovim
          yazi
          colorls
          eza
          lazygit
          fastfetch
          bat
          glow
          miller
          ouch
          ripgrep
          archivemount
          rsync
        ]
      );
      file = {
        ".config/yazi".source = ../packages/yazi;
      };
    };
  };
}
