{ pkgs, ... }:
let
  mod = "SUPER_L";
  term = "kitty";
in
{
  imports = [
    ./hyprpaper.nix
    ./hyprlock.nix
    ./redshift.nix # hyprsunset
    ./waybar.nix
  ];

  home.packages = with pkgs; [
    hyprpaper
    hyprpicker
    hyprshot

    gnome-themes-extra
    papirus-icon-theme
    adwaita-qt6
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    qt6Packages.qt6ct

    wireplumber
    dunst
    libnotify
    networkmanagerapplet

    # Testing
    fuzzel
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      env = [
        "XCURSOR_SIZE, 24"
        "T_QPA_PLATFORMTHEME, qt6ct"
        "XCURSOR_THEME, Adwaita"
        "TK_THEME, Adwaita-dark"
        "GTK_THEME, Adwaita:dark"
        "AQ_DRM_DEVICES, /dev/dri/card1:/dev/dri/card0" # Disable nvidia for hyprland
      ];

      exec-once = [
        "${pkgs.waybar}/bin/waybar"
        "${pkgs.swayosd}/bin/swayosd-client"
        "${pkgs.dconf}/bin/gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'"
        "${pkgs.dconf}/bin/gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'"

        # Default workspace programs
        "[workspace 1 silent] kitty"
        "[workspace 2 silent] librewolf"
        "[workspace 3 silent] spotify"
        "[workspace 4 silent] vesktop"
      ];

      input = {
        kb_layout = "se"; # Keyboard Layout
        kb_options = "caps:escape"; # Rebind CapsLock to Escape

        touchpad = {
          natural_scroll = true; # Normal Person Scroll
          scroll_factor = 0.15; # Scroll in normal speed
        };
      };

      monitor = [
        "eDP-1, 1920x1200@60, 0x0, 1.0, bitdepth, 10"

        # "DP-7, 2560x1440@60, auto, 1"
        "DP-7, 1920x1080@60, auto, 1"
        "DP-8, 1920x1080@60, auto, 1"
      ];

      bind = [
        "${mod}, RETURN, exec, ${term}"
        "${mod}, M, exit"

        "${mod}, F, fullscreen"
        "${mod}, P, exec, pkill hyprpicker || hyprpicker -a"
        "${mod}, SPACE, togglefloating"
        "SUPER, ${mod}, exec, pkill fuzzel || fuzzel"
        "${mod}, E, exec, thunar"

        "${mod}, S, togglespecialworkspace"

        "${mod}, Q, killactive"

        "${mod}, PRINT, exec, hyprshot -m window --freeze -o $XDG_SCREENSHOTS_DIR"
        ", PRINT, exec, hyprshot -m region --freeze -o $XDG_SCREENSHOTS_DIR"

        "${mod}, 1, workspace, 1"
        "${mod}, 2, workspace, 2"
        "${mod}, 3, workspace, 3"
        "${mod}, 4, workspace, 4"
        "${mod}, 5, workspace, 5"
        "${mod}, 6, workspace, 6"
        "${mod}, 7, workspace, 7"
        "${mod}, 8, workspace, 8"
        "${mod}, 9, workspace, 9"

        "${mod}, H, movefocus, l"
        "${mod}, J, movefocus, d"
        "${mod}, K, movefocus, u"
        "${mod}, L, movefocus, r"

        "${mod} SHIFT, H, movewindow, l"
        "${mod} SHIFT, J, movewindow, d"
        "${mod} SHIFT, K, movewindow, u"
        "${mod} SHIFT, L, movewindow, r"

        "${mod}, TAB, workspace, r+1"
        "${mod} SHIFT, TAB, workspace, r-1"

        "${mod} SHIFT, 1, moveToWorkspace, 1"
        "${mod} SHIFT, 2, moveToWorkspace, 2"
        "${mod} SHIFT, 3, moveToWorkspace, 3"
        "${mod} SHIFT, 4, moveToWorkspace, 4"
        "${mod} SHIFT, 5, moveToWorkspace, 5"
        "${mod} SHIFT, 6, moveToWorkspace, 6"
        "${mod} SHIFT, 7, moveToWorkspace, 7"
        "${mod} SHIFT, 8, moveToWorkspace, 8"
        "${mod} SHIFT, 9, moveToWorkspace, 9"

        # Multimedia keybindings
        ", XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
        ", XF86AudioMicMute, exec, swayosd-client --input-volume mute-toggle"
        ", XF86AudioPlay, exec, swayosd-client --playerctl play-pause"
        ", XF86AudioNext, exec, swayosd-client --playerctl next"
        ", XF86AudioPrev, exec, swayosd-client --playerctl prev"
      ];

      binde = [
        ", XF86AudioLowerVolume, exec, swayosd-client --output-volume lower --max-volume 150"
        ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise --max-volume 150"

        ", XF86MonBrightnessDown, exec, swayosd-client --brightness lower"
        ", XF86MonBrightnessUp, exec, swayosd-client --brightness raise"
      ];

      bindm = [
        "${mod}, mouse:272, movewindow"
        "${mod}, mouse:273, resizewindow"
      ];

      decoration = {
        rounding = 8;

        blur = {
          enabled = true;
          size = 6;
          passes = 3;
          noise = 0.02;
          contrast = 1.1;
          brightness = 1.0;
          popups = true;
        };
      };

      # Disable gaps when only one window
      workspace = [
        "w[tv1], gapsout:0, gapsin:0"
        "f[1], gapsout:0, gapsin:0"
      ];

      windowrulev2 = [
        "bordersize 0, floating:0, onworkspace:w[tv1]"
        "rounding 0, floating:0, onworkspace:w[tv1]"
        "bordersize 0, floating:0, onworkspace:f[1]"
        "rounding 0, floating:0, onworkspace:f[1]"

        "workspace 3, class:^spotify$"
        "workspace 4, class:^vesktop$"

        # Blurring on terminal
        "noblur, class:^(?!${term}).*$"
        "opacity 0.87 0.87, class:^(${term})$"
      ];

      general = {
        gaps_out = 8;
      };

      animations = {
        enabled = false; # Temp
        bezier = [
          "fastBezier, 0.1, 0.8, 0.2, 1.0"
        ];
        animation = [
          "windows, 1, 3, fastBezier"
          "windowsOut, 1, 2, fastBezier, popin 80%"
          "border, 1, 5, fastBezier"
          "fade, 1, 4, fastBezier"
          "workspaces, 1, 3, fastBezier"
        ];
      };

      misc = [
        "vfr = true"
      ];
    };
  };

  xdg.configFile."dunst/dunstrc".text = ''
    [global]
    ### Display
    monitor = 0
    follow = none
    width = 300
    height = (50, 50)
    origin = bottom-center
    offset = (0, 50)
    scale = 0
    notification_limit = 0

    ### Geometry
    progress_bar = true
    progress_bar_height = 10
    progress_bar_frame_width = 1
    progress_bar_min_width = 150
    progress_bar_max_width = 150

    ### Text
    font = Monospace 10
    line_height = 0
    format = "%p"  # No text in notification
    alignment = left
    vertical_alignment = center
    show_age_threshold = 60
    word_wrap = no
    ignore_newline = no
    stack_duplicates = false
    hide_duplicate_count = false
    show_indicators = no

    ### Icons
    icon_position = left
    max_icon_size = 32

    ### Appearance
    transparency = 10
    separator_height = 2
    padding = 8
    horizontal_padding = 8
    text_icon_padding = 8
    frame_width = 2
    frame_color = "#89B4FA"
    separator_color = frame
    corner_radius = 10
    background = "#1E1E2E"
    foreground = "#CDD6F4"
    highlight = "#89B4FA"

    ### Behavior
    timeout = 3

    [volume]
    summary = "Volume"
    appname = "volume"
    format = "%p"  # Ensure no text
    set_stack_tag = "volume"
    urgency = low
    timeout = 2
  '';

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    cursorTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style = {
      name = "Adwaita-dark";
      package = pkgs.adwaita-qt6;
    };
  };

  services = {
    swayosd.enable = true;
  };
}
