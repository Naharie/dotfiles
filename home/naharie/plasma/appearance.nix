{ pkgs
, inputs
, ...
}:

let mur = inputs.self.packages.${pkgs.system}; in
{
  programs.plasma = {
    workspace = {
      theme = "breeze-light";
      colorScheme = "BreezeLight";

      wallpaper = "/home/naharie/Pictures/wallpaper/pictures.wallpaper.7.png";
      wallpaperFillMode = "preserveAspectCrop";

      cursor.theme = "ArcAurora-cursors";
      splashScreen.theme = "None";
    };

    kscreenlocker = {
      appearance.wallpaper = "/home/naharie/Pictures/wallpaper/pictures.wallpaper.2.jpg";
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
    pkgs.papirus-folders
    pkgs.papirus-icon-theme
  ];
}
