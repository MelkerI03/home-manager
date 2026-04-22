{ config, ... }:

let
  inherit (config.catppuccin) sources;

  cfg = config.catppuccin.waybar;
  styleFile = "${sources.waybar}/${cfg.flavor}.css";
in
{
  programs.waybar = {
    enable = false;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 48;
        spacing = 6;

        modules-left = [
          "custom/notification"
          "clock"
        ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [
          "pulseaudio"
          "bluetooth"
          "network"
          "power-profiles-daemon"
          "battery"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "󰈹";
            "3" = "";
            "4" = "󰭹";
            "active" = "";
            "default" = "";
          };
          sort-by-number = true;
          persistent-workspaces = {
            "*" = 5; # Show 5 workspaces by default
          };
        };

        "custom/notification" = {
          tooltip = false;
          format = "";
          escape = true;
        };

        clock = {
          format = "{:%H:%M:%S} ";
          interval = 1;
          tooltip-format = "<tt>{calendar}</tt>";
          calendar = {
            format = {
              today = "<span color='#fAfBfC'><b>{}</b></span>";
            };
          };
          actions = {
            on-click-right = "shift_down";
            on-click = "shift_up";
          };
        };

        network = {
          format-wifi = "󰤨";
          format-ethernet = "";
          format-disconnected = "";
          tooltip-format-disconnected = "Error";
          tooltip-format-wifi = "{essid} ({signalStrength}%) ";
          tooltip-format-ethernet = "{ifname} 🖧 ";
          on-click = "nm-connection-editor";
        };

        "pulseaudio" = {
          format = "{icon}";
          tooltip-format = "{desc} ({volume}%)";
          tooltip = true;
          format-muted = "";
          format-icons = {
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "pwvucontrol";
        };

        bluetooth = {
          format-on = "󰂯";
          format-off = "BT-off";
          format-disabled = "󰂲";
          format-connected-battery = "{device_battery_percentage}% 󰂯";
          format-alt = "{device_alias} 󰂯";
          tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\n{device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\n{device_address}\n{device_battery_percentage}%";
          on-click = "blueman-manager";
        };

        power-profiles-daemon = {
          format = "{icon}";
          tooltip-format = "{profile}";
          tooltip = true;
          format-icons = {
            default = "";
            performance = "";
            balanced = "";
            "power-saver" = "";
          };
        };

        battery = {
          interval = 30;
          states = {
            good = 95;
            warning = 30;
            critical = 5;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% 󰂄";
          format-plugged = "{capacity}% 󰂄 ";
          format-alt = "{time} {icon}";
          format-icons = [
            "󰁻"
            "󰁼"
            "󰁾"
            "󰂀"
            "󰂂"
            "󰁹"
          ];
        };

        "custom/expand" = {
          format = "";
          tooltip = false;
        };

        "custom/endpoint" = {
          format = "|";
          tooltip = false;
        };
      };
    };

    style = ''
      @import url('../../.cache/wal/colors-waybar.css');

      * {
        font-size:15px;
        font-family: "FiraCode Nerd Font Mono";
      }

      window#waybar{
        all:unset;
      }

      .modules-left {
        padding:7px;
        margin:10px 0px 5px 10px;
        border-radius:10px;
        background: alpha(@background,.6);
        box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
      }

      .modules-center {
        padding:7px;
        margin:10px 0px 5px 0px;
        border-radius:10px;
        background: alpha(@background,.6);
        box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
      }

      .modules-right {
        padding:7px;
        margin: 10px 10px 5px 0px;
        border-radius:10px;
        background: alpha(@background,.6);
        box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
      }

      #tooltip {
        background: @background;
        color: @color7;
      }

      #clock:hover, #custom-notification:hover,#bluetooth:hover,#network:hover,#battery:hover, #cpu:hover,#memory:hover,#temperature:hover, #pulseaudio:hover, #power-profiles-daemon:hover{
        transition: all .3s ease;
        color:@color9;
      }

      #pulseaudio, #power-profiles-daemon, #custom-notification, #clock, #bluetooth, #network, #battery {
        padding: 0px 5px;
        color:@color7;
        transition: all .3s ease;
      }

      #workspaces {
        padding: 0px 5px;
      }

      #workspaces button {
        all:unset;
        padding: 0px 5px;
        color: alpha(@color9,.4);
        transition: all .2s ease;
      }

      #workspaces button:hover {
        color:rgba(0,0,0,0);
        border: none;
        text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
        transition: all 1s ease;
      }

      #workspaces button.active {
        color: @color9;
        border: none;
        text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
      }

      #workspaces button.empty {
        color: alpha(@color9,.4);
        border: none;
        text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
      }

      #workspaces button.empty:hover {
        color: rgba(0,0,0,0);
        border: none;
        text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
        transition: all 1s ease;
      }

      #workspaces button.empty.active {
        color: @color9;
        border: none;
        text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
      }

      #battery.charging {
        color: #26A65B;
      }

      #battery.warning:not(.charging) {
        color: #ffbe61;
      }

      #battery.critical:not(.charging) {
        color: #f53c3c;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }
    '';
  };
}
