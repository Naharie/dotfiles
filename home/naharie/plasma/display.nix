{
  ...
}:

{
  programs.plasma = {
    kwin = {
      effects = {
        shakeCursor.enable = true;
      };

      virtualDesktops = {
        number = 9;
        rows = 3;
      };
    };

    configFile = {
      kdeglobals = {
        KScreen.ScreenScaleFactors = "HDMI-0=1.25;DP-0=1.25;DP-1=1.25;DP-2=1.25;DP-3=1.25;DP-4=1.25;DP-5=1.25;";
      };

      kwinrc = {
        Compositing = {
          AllowTearing = false;
          LatencyPolicy = "Medium";
        };

        EdgeBarrier = {
          CornerBarrier = false;
          EdgeBarrier = 0;
        };

        Effect-hidecursor.HideOnTyping = true;
        Effect-overview.BorderActivate = 9;

        Plugins = {
          desktopchangeosdEnabled = true;
          dimscreenEnabled = true;
          hidecursorEnabled = true;
          sticky-window-snappingEnabled = true;
        };

        Xwayland = {
          Scale = 1.25;
          XwaylandEavesdrops = "Combinations";
        };

        TabBox.LayoutName = "thumbnail_grid";
      };
    };
  };
}