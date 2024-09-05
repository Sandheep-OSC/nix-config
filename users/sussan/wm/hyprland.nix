{config, lib, pkgs, pkgs-unstable, ... }:

{
  imports = [];

  options = {};

  config = {

    wayland.windowManager.hyprland = {
        enable = true;
        systemd.variables = ["-all"];
        extraConfig = ''
          exec = "$HOME/.config/hypr/swww_slideshow.sh"
          exec-once = "sh $HOME/.config/hypr/check_battery.sh"
          exec-once = "clipse --listen-shell"
          windowrulev2= opacity 0.80 0.80,class:^(.*)
          windowrulev2 = float,class:(clipse) # ensure you have a floating window class set if you want this behaviour
          windowrulev2 = size 622 652,class:(clipse) # set the size of the window as necessary
          general {
            border_size = 4
            #col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
            col.active_border=rgb(cdd6f4)
            col.inactive_border = rgba(595959aa)
          }
          decoration {
            rounding = 15
            active_opacity = 1.0;
            inactive_opacity = 0.6;
            fullscreen_opacity = 1.0;
          }
          bind = $mod SHIFT, Z, exec, pypr zoom
          bind = $mod SHIFT, O, exec, pypr shift_monitors +1
          bind = $mod, B, exec, pypr expose
          bind = $mod, K, exec, pypr change_workspace +1
          bind = $mod, J, exec, pypr change_workspace -1
          bind = $mod,L,exec, pypr toggle_dpms
          bind = $mod SHIFT,M,exec,pypr toggle stb stb-logs
          bind = $mod,A,exec,pypr toggle term
          # bind = $mod,V,exec,pypr toggle volume

          # Switch to a submap called resize for resizing windows
          bind = ALT, R, submap, resize
          bind = ALT, R, exec, notify-send "Resize Mode Activated"

          # Switch to a submap called move for moving windows
          bind = ALT, M, submap, move
          bind = ALT, M, exec, notify-send "Move Mode Activated"

          # Start a submap called "resize" for resizing active window
          submap = resize

          # Sets repeatable binds for resizing the active window
          binde = , right, resizeactive, 10 0
          binde = , left, resizeactive, -10 0
          binde = , up, resizeactive, 0 -10
          binde = , down, resizeactive, 0 10

          # Use reset to go back to the global submap
          bind = , escape, submap, reset

          # Start a submap called "move" for moving active window
          submap = move

          # Sets repeatable binds for moving the active window
          binde = , right, moveactive, 10 0
          binde = , left, moveactive, -10 0
          binde = , up, moveactive, 0 -10
          binde = , down, moveactive, 0 10

          # Use reset to go back to the global submap
          bind = , escape, submap, reset

          # Reset submap to return to the global context
          submap = reset
        '';
        settings = {
          "$mod" = "SUPER";
          "$terminal" = "wezterm";
          "$fileManager" = "dolphin";
          "$menu" = "wofi --show drun";
          "exec-once" = [
            "waybar"
            "mako"
            "nm-applet --indicator"
            "blueman-applet"
            "swww-daemon"
            "pypr"
          ];
          monitor="eDP-1,1920x1080@60.00800,0x0,1.25";
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

            ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
            ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
            ", XF86MonBrightnessUp, exec, brightnessctl -e set 2%+"
            ", XF86MonBrightnessDown, exec, brightnessctl -e set 2%-"
            ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
            ", XF86AudioPlay, exec, playerctl play-pause"
            ", XF86AudioPrev, exec, playerctl previous"
            ", XF86AudioNext, exec, playerctl next"

            "$mod, Z, exec, alacritty --class clipse -e 'clipse'"
            "$mod, F, exec, alacritty --class yazi -e 'yazi'"

            # "$mod, A, exec, pypr toggle term"
            # "$mod, B, exec, pypr expose"
            # "$mod, J, exec, pypr change_workspace -1"
            # "$mod, K, exec, pypr change_workspace +1"
            # "$mod,  N, exec, pypr toggle_special minimized"
            # "$mod SHIFT, O, exec, pypr shift_monitors +1"
            # "$mod SHIFT, Z, exec, pypr zoom ++0.5"
            # "$mod, Z, exec, pypr zoom"
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
        (pkgs.waybar.overrideAttrs (
          oldAttrs: {
            mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
          }
        ))
        wofi
        libsForQt5.dolphin
        blueman
        networkmanagerapplet
        libinput-gestures
        hyprlandPlugins.hyprtrails
        brightnessctl
        wireplumber
        mako
        libnotify
        udiskie
        swww
        pywal
      ] ++ (
        with pkgs-unstable; [
          clipse
          pyprland
          playerctl
          cava
          helvum
          pavucontrol
        ]
      );
      file = {
        ".config/hypr/wallpapers".source = ./wallpapers;
        ".config/hypr/swww_slideshow.sh".source = ../scripts/swww_slideshow.sh;
        ".ssh/config".source = ../scripts/ssh_config/config;
        ".config/hypr/pyprland.toml".source = ./plugins/pyprland/pyprland.toml;
        ".config/hypr/check_battery.sh".source = ../scripts/check_battery.sh;
        ".config/waybar".source = ./plugins/waybar;
        ".config/cava".source = ./plugins/cava;
      };
    };
  };
}

