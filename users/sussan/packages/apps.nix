{ config, lib, pkgs, pkgs-unstable, ... }:

{
  imports = [];

  options = {};

  config = {

    programs = {
    };

    home = {
      packages = with pkgs; [
        vscode
        zed-editor
        google-chrome
      ] ++ (
        with pkgs-unstable; [
            floorp
          ]
      );
      file = {};
    };
  };
}

