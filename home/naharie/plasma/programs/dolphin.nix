{ inputs
,  ...
}:

let
  lib = inputs.nixpkgs.lib;
in
{
  programs.plasma.configFile = {
    dolphinrc = {
      General = {
        BrowseThroughArchives = true;
        RememberOpenedTabs = false;
        ShowFullPath = true;
        ShowFullPathInTitlebar = true;
        ShowSpaceInfo = false;
        ShowZoomSlider = false;
      };
      "KFileDialog Settings" = {
        "Places Icons Auto-resize" = false;
        "Places Icons Static Size" = 22;
      };
      PreviewSettings.Plugins = lib.strings.concatStringsSep "," [
        "audiothumbnail"
        "blenderthumbnail"
        "comicbookthumbnail"
        "cursorthumbnail"
        "djvuthumbnail"
        "ebookthumbnail"
        "exrthumbnail"
        "directorythumbnail"
        "fontthumbnail"
        "imagethumbnail"
        "jpegthumbnail"
        "kraorathumbnail"
        "windowsexethumbnail"
        "windowsimagethumbnail"
        "mobithumbnail"
        "opendocumentthumbnail"
        "gsthumbnail"
        "rawthumbnail"
        "svgthumbnail"
        "ffmpegthumbs"
      ];
    };

    configFile = {
      kdeglobals = {
        KDE = {
          SingleClick = false;
          ShowDeleteCommand = true;
        };

        PreviewSettings = {
          EnableRemoteFolderThumbnail = true;
          MaximumRemoteSize = 31457280;
        };

        "KFileDialog Settings" = {
          "Automatically select filename extension" = true;
          "Show Full Path" = true;
          "Show Inline Previews" = true;
          "Show Preview" = false;
          "Show hidden files" = false;
          "Sort by" = "Name";
          "Sort directories first" = true;
        };
      };

      kiorc = {
        Confirmations = {
          ConfirmDelete = true;
          ConfirmEmptyTrash = true;
          ConfirmTrash = false;
        };

        "Executable scripts".behaviourOnLaunch = "alwaysAsk";
      };

      kservicemenurc.Show = {
        compressfileitemaction = true;
        extractfileitemaction = true;
        forgetfileitemaction = true;
        installFont = true;
        kactivitymanagerd_fileitem_linking_plugin = true;
        kio-admin = true;
        makefileactions = true;
        mountisoaction = true;
        movetonewfolderitemaction = true;
        runInKonsole = true;
        slideshowfileitemaction = true;
        tagsfileitemaction = true;
        wallpaperfileitemaction = true;
      };

      ktrashrc = {
        "\\/home\\/naharie\\/.local\\/share\\/Trash" = {
          UseSizeLimit = false;
          UseTimeLimit = false;
        };
      };
    };
  };
}