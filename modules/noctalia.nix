{ noctalia, config, ... }:
let
  configDir = config.xdg.configHome;
in
{
  # import the home manager module
  imports = [
    noctalia.homeModules.default
  ];

  # configure options
  programs.noctalia-shell = {
    enable = true;
    settings = {
      # configure noctalia here
      bar = {
        density = "comfortable";
        position = "top";
        showCapsule = false;
        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
            # {
            #   id = "Network";
            # }
            # {
            #   id = "Bluetooth";
            # }
          ];
          center = [
            {
              hideUnoccupied = false;
              id = "Workspace";
              labelMode = "none";
            }
          ];
          right = [
            {
              alwaysShowPercentage = false;
              id = "Battery";
              warningThreshold = 30;
            }
            {
              formatHorizontal = "HH:mm:ss";
              formatVertical = "HH mm:ss";
              id = "Clock";
              useMonospacedFont = true;
              usePrimaryColor = true;
            }
          ];
        };
      };
      colorSchemes.predefinedScheme = "Catppuccin";
      # general = {
      #   avatarImage = "/home/drfoobar/.face";
      #   radiusRatio = 0.2;
      # };
      location = {
        monthBeforeDay = false;
        name = "Enköping, Sweden";
      };
    };
  };

  home.file.".cache/noctalia/wallpapers.json" = {
    text = builtins.toJSON {
      defaultWallpaper = "${configDir}/home-manager/wallpapers/norway.png";
      # wallpapers = {
      #   "DP-1" = "/path/to/monitor/wallpaper.png";
      # };
    };
  };
}
