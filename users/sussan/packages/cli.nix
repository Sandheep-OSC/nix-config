
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
      ] ++ (
        with pkgs-unstable; []
      );
      file = {};
    };
  };
}
