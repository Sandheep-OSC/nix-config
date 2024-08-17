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
        interactiveShellInit = ''
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
