{
  ...
}:

{
  programs.plasma = {
    spectacle.shortcuts = {
      captureEntireDesktop = "Print";
      captureWindowUnderCursor = "Shift+Print";
      captureRectangularRegion = "Ctrl+Print";
    };

    shortcuts = {
      kmix = {
        increase_volume = "PgUp";
        increase_volume_small = "Shift+PgUp";

        decrease_volume = "PgDown";
        decrease_volume_small = "Shift+PgDown";

        mute = "ScrollLock";
      };
      mediacontrol.playpausemedia = "Pause";

      plasmashell = {
        "activate application launcher" = "Meta";

        "activate task manager entry 1" = "Meta+1";
        "activate task manager entry 2" = "Meta+2";
        "activate task manager entry 3" = "Meta+3";
        "activate task manager entry 4" = "Meta+4";
        "activate task manager entry 5" = "Meta+5";
        "activate task manager entry 6" = "Meta+6";
        "activate task manager entry 7" = "Meta+7";
        "activate task manager entry 8" = "Meta+8";
        "activate task manager entry 9" = "Meta+9";
      };

      kwin = {
        "Kill Window" = "Meta+Ctrl+Esc";

        "Grid View" = "Meta+Tab";

        "Switch One Desktop Up" = "Meta+Ctrl+Up";
        "Switch One Desktop Down" = "Meta+Ctrl+Down";
        "Switch One Desktop to the Left" = "Meta+Ctrl+Left";
        "Switch One Desktop to the Right" = "Meta+Ctrl+Right";

        "Walk Through Windows" = "Alt+Tab";
        "Walk Through Windows (Reverse)" = "Alt+Shift+Tab";
        "Window Close" = "Meta+Q";

        "Window Fullscreen" = "Meta+F";

        "view_actual_size" = "Meta+)";
        "view_zoom_in" = "Meta++";
        "view_zoom_out" = "Meta+_";
      };

      "services/org.kde.dolphin.desktop" = { _launch = "Meta+E"; };
      "services/org.kde.konsole.desktop" = { _launch = "Meta+T"; };
    };

    configFile = {
      kdeglobals = {
        # Needed so we can use Page Up and Page Down for media control.
        Shortcuts = {
          Next = "";
          Prior = "";
        };
      };
    };

    workspace = {
      enableMiddleClickPaste = false;
    };
  };
}