{config, lib, pkgs, pkgs-unstable, ... }:

{
  imports = [];

  options = {};

  config = {

    wayland.windowManager.hyprland = {
        enable = true;
        systemd.variables = ["-all"];
        settings = {
          "$mod" = "SUPER";
          "$terminal" = "alacritty";
          "$fileManager" = "dolphin";
          "$menu" = "wofi --show drun";
          "exec-once" = [ "waybar" "mako" "nm-applet --indicator" "blueman-applet" ];
          monitor="eDP-1,1920x1080@60.00800,0x0,1.333333";
          input = {
            # follow_mouse = 1;
            # sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

            touchpad = {
                natural_scroll = true;
            };
          };
          gestures = {
            # See https://wiki.hyprland.org/Configuring/Variables/ for more
            workspace_swipe = true ;
          };
          env = [];
          bindm = [
            "$mod, mouse:272, movewindow"
            "$mod, mouse:273, resizewindow"
          ];
          bind = [
            "$mod, Q, exec, $terminal"
            "$mod, C, killactive"
            "$mod, M, exit"
            "$mod, E, exec, $fileManager"
            "$mod, V, togglefloating"
            "$mod, SPACE, exec, $menu"
            "$mod, P, pseudo, # dwindle"
            "$mod, J, togglesplit, # dwindle"

            # Move focus with mod + arrow keys
            "$mod, left, movefocus, l"
            "$mod, right, movefocus, r"
            "$mod, up, movefocus, u"
            "$mod, down, movefocus, d"

            # Switch workspaces with mod + [0-9]
            "$mod, 1, workspace, 1"
            "$mod, 2, workspace, 2"
            "$mod, 3, workspace, 3"
            "$mod, 4, workspace, 4"
            "$mod, 5, workspace, 5"
            "$mod, 6, workspace, 6"
            "$mod, 7, workspace, 7"
            "$mod, 8, workspace, 8"
            "$mod, 9, workspace, 9"
            "$mod, 0, workspace, 10"

            # Move active window to a workspace with mod + SHIFT + [0-9]
            "$mod SHIFT, 1, movetoworkspace, 1"
            "$mod SHIFT, 2, movetoworkspace, 2"
            "$mod SHIFT, 3, movetoworkspace, 3"
            "$mod SHIFT, 4, movetoworkspace, 4"
            "$mod SHIFT, 5, movetoworkspace, 5"
            "$mod SHIFT, 6, movetoworkspace, 6"
            "$mod SHIFT, 7, movetoworkspace, 7"
            "$mod SHIFT, 8, movetoworkspace, 8"
            "$mod SHIFT, 9, movetoworkspace, 9"
            "$mod SHIFT, 0, movetoworkspace, 10"

            # Example special workspace (scratchpad)
            "$mod, S, togglespecialworkspace, magic"
            "$mod SHIFT, S, movetoworkspace, special:magic"

            # Scroll through existing workspaces with mod + scroll
            "$mod, mouse_down, workspace, e+1"
            "$mod, mouse_up, workspace, e-1"
        ];
      };
      plugins = [
        pkgs.hyprlandPlugins.borders-plus-plus
        pkgs.hyprlandPlugins.csgo-vulkan-fix
        pkgs.hyprlandPlugins.hy3
        pkgs.hyprlandPlugins.hyprtrails
        pkgs.hyprlandPlugins.hyprexpo
        pkgs.hyprlandPlugins.hyprwinwrap
      ];
    };

    programs = {};

    home = {
      packages = with pkgs; [ 
        wofi
        libsForQt5.dolphin
        blueman
        networkmanagerapplet
        libinput-gestures
        hyprlandPlugins.hyprtrails
      ] ++ (
        with pkgs-unstable; []
      );
      file = {};
    };
  };
}

