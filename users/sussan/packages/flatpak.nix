

{ config, lib, pkgs, modulesPath, ... }:

{
  services.flatpak = {
    enable = true;
    remotes = lib.mkOptionDefault [{
      name = "flathub-beta";
      location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
    }];
    update.auto.enable = true;
    uninstallUnmanaged = false;
    packages = [
      "com.notesnook.Notesnook"
      "com.vivaldi.Vivaldi"
      "md.obsidian.Obsidian"
      # "com.google.Chrome"
      "com.obsproject.Studio"
      "com.spotify.Client"
      "com.discordapp.Discord"
      "org.telegram.desktop"
      "com.brave.Browser"
      "com.getpostman.Postman"
      "org.gnome.baobab"
    ];
  };
}
