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
          export NIXPKGS_ALLOW_UNFREE=1
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
