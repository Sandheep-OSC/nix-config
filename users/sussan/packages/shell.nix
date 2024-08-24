{ config, lib, pkgs, pkgs-unstable, ... }:

{
  imports = [];

  options = {};

  config = {

    programs = {
      bash = {
        enable = true;
        # extraConfig = ''
        #   ${shellAliases}
        # '';
      };
      zsh = {
        enable = true;
        initExtraFirst = ''
        '';
      };
      fish = {
        enable = true;
        shellAliases = {
          ls = "colorls";
          nvim-jdhao="NVIM_APPNAME=$NEOVIM_PROFILE_PATH/jdhao/ nvim";
          nvim-xero="NVIM_APPNAME=$NEOVIM_PROFILE_PATH/xero/ nvim";
          nvim-astro="NVIM_APPNAME=$NEOVIM_PROFILE_PATH/astrovim/ nvim";
          nvim-josean="NVIM_APPNAME=$NEOVIM_PROFILE_PATH/josean/ nvim";
          nvim-ecosse3="NVIM_APPNAME=$NEOVIM_PROFILE_PATH/ecosse3/ nvim";
          nvim-rafi="NVIM_APPNAME=$NEOVIM_PROFILE_PATH/rafi/ nvim";
          nvim-sf="NVIM_APPNAME=$NEOVIM_PROFILE_PATH/sandheep-first/ nvim";
          nvim-s="NVIM_APPNAME=$NEOVIM_PROFILE_PATH/sandheep/ nvim";
          lz="NVIM_APPNAME=$NEOVIM_PROFILE_PATH/lazyvim/ nvim";
        };
        interactiveShellInit = ''
          export NIXPKGS_ALLOW_UNFREE=1
          export NEOVIM_PROFILE_PATH="neovim"
          fastfetch
        '';
      };
    };

    home = {
      packages = with pkgs; [ ] ++ (
        with pkgs-unstable; []
      );
      file = {};
    };
  };
}
