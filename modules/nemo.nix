{ pkgs, ... }:
{
  home.packages = with pkgs; [ nemo ];

  # Hide menu bar
  dconf.settings = {
    "org/nemo/window-state" = {
      menubar-visible = false;
    };
  };
}
