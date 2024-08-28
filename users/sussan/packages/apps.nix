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
        google-chrome
      ] ++ (
        with pkgs-unstable; [
            floorp
            zed-editor
          ]
      );
      file = {};
    };
  };
}

