{ pkgs
, ...
}:

let mur = import ../../../packages { inherit pkgs; }; in
{
  programs.plasma = {
    workspace = {
      theme = "Breeze";
      colorScheme = "Andromeda";

      wallpaper = "/home/naharie/Pictures/wallpaper/10.jpg";
      wallpaperFillMode = "preserveAspectCrop";

      cursor.theme = "ArcAurora-cursors";
      splashScreen.theme = "None";


      iconTheme = "candy-icons";
    };

    kscreenlocker = {
      appearance.wallpaper = "/home/naharie/Pictures/wallpaper/2.jpg";
    };

    kwin = {
      effects = {
        dimInactive.enable = true;
        desktopSwitching.animation = "slide";
        dimAdminMode.enable = true;
      };

      titlebarButtons.left = [ "more-window-actions" ];
      titlebarButtons.right = [ "minimize" "maximize" "close" ];
    };

    configFile = {
      kdeglobals = {
        General = {
          AccentColor = "61,212,37";
          LastUsedCustomAccentColor = "61,212,37";

          XftAntialias = true;
          XftHintStyle = "hintfull";
          XftSubPixel = "none";
        };

        KDE = {
          widgetStyle = "Breeze";
        };
      };
    };
  };

  home.packages = [
    mur.arcaurora-cursors
    mur.andromeda-theme
    pkgs.candy-icons
  ];
}