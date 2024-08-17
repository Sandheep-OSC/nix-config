
{ config, lib, pkgs, pkgs-unstable, ... }:

{
  imports = [];

  options = {};

  config = {

    programs = {};

    home = {
      packages = with pkgs; [
        kdePackages.filelight
      ] ++ (
        with pkgs-unstable; []
      );
      file = {};
    };
  };
}
