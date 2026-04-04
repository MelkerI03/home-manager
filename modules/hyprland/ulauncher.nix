{
  pkgs,
  ...
}:

let
  radius = 14;
  flavor = "frappe";
  accent = "blue";

  colorPalette = {
    latte = {
      baseColor = "#eff1f5";
      textColor = "#4c4f69";
      subTextColor = "#5c5f77";
      rosewater = "#dc8a78";
      flamingo = "#dd7878";
      pink = "#ea76cb";
      mauve = "#8839ef";
      red = "#d20f39";
      maroon = "#e64553";
      peach = "#fe640b";
      yellow = "#df8e1d";
      green = "#40a02b";
      teal = "#179299";
      sky = "#04a5e5";
      sapphire = "#209fb5";
      blue = "#1e66f5";
      lavender = "#7287fd";
    };

    frappe = {
      baseColor = "#303446";
      textColor = "#c6d0f5";
      subTextColor = "#b5bfe2";
      rosewater = "#f2d5cf";
      flamingo = "#eebebe";
      pink = "#f4b8e4";
      mauve = "#ca9ee6";
      red = "#e78284";
      maroon = "#ea999c";
      peach = "#ef9f76";
      yellow = "#e5c890";
      green = "#a6d189";
      teal = "#81c8be";
      sky = "#99d1db";
      sapphire = "#85c1dc";
      blue = "#8caaee";
      lavender = "#babbf1";
    };

    macchiato = {
      baseColor = "#24273a";
      textColor = "#cad3f5";
      subTextColor = "#b8c0e0";
      rosewater = "#f4dbd6";
      flamingo = "#f0c6c6";
      pink = "#f5bde6";
      mauve = "#c6a0f6";
      red = "#ed8796";
      maroon = "#ee99a0";
      peach = "#f5a97f";
      yellow = "#eed49f";
      green = "#a6da95";
      teal = "#8bd5ca";
      sky = "#91d7e3";
      sapphire = "#7dc4e4";
      blue = "#8aadf4";
      lavender = "#b7bdf8";
    };

    mocha = {
      baseColor = "#1e1e2e";
      textColor = "#cdd6f4";
      subTextColor = "#bac2de";
      rosewater = "#f5e0dc";
      flamingo = "#f2cdcd";
      pink = "#f5c2e7";
      mauve = "#cba6f7";
      red = "#f38ba8";
      maroon = "#eba0ac";
      peach = "#fab387";
      yellow = "#f9e2af";
      green = "#a6e3a1";
      teal = "#94e2d5";
      sky = "#89dceb";
      sapphire = "#74c7ec";
      blue = "#89b4fa";
      lavender = "#b4befe";
    };
  };

  palette = colorPalette.${flavor};
  accentColor = palette.${accent};

  selectedBackgroundOpacity = if flavor == "latte" then "0.1" else "0.3";

  gearHoverOpacity = if flavor == "latte" then "0.2" else "1.0";

  themeName = "Catppuccin-${flavor}-${accent}";
in
{
  # programs.ulauncher.enable = true;
  home.packages = with pkgs; [
    ulauncher
  ];

  xdg.configFile."ulauncher/user-themes/${themeName}/manifest.json".text = builtins.toJSON {
    manifest_version = "1";
    name = themeName;
    display_name = builtins.replaceStrings [ "-" ] [ " " ] themeName;
    extend_theme = "light";
    css_file = "theme.css";
    "css_file_gtk_3.20+" = "theme-gtk-3.20.css";
    matched_text_hl_colors = {
      when_selected = accentColor;
      when_not_selected = accentColor;
    };
  };

  xdg.configFile."ulauncher/user-themes/${themeName}/theme.css".text = ''
    @define-color backgroundColor ${palette.baseColor};
    @define-color accentColor ${accentColor};
    @define-color textColor ${palette.textColor};
    @define-color subTextColor ${palette.subTextColor};

    .app {
      background-color: @backgroundColor;
      border-color: @accentColor;
      border-radius: ${toString radius}px;
    }

    .selected.item-box {
      background-color: alpha(@accentColor, ${selectedBackgroundOpacity});
      border-radius: ${toString radius}px;
    }

    .prefs-btn:hover {
      background-color: alpha(@accentColor, ${gearHoverOpacity});
    }
  '';

  xdg.configFile."ulauncher/user-themes/${themeName}/theme-gtk-3.20.css".text = ''
    @import url("theme.css");

    .input {
      caret-color: ${accentColor};
    }

    .selected.item-box {
      border: none;
    }
  '';
}
