{
    programs.plasma = {
        enable = true;
        shortcuts = {
            "kmix"."decrease_volume" = ["Volume Down" "PgDown,Volume Down,Decrease Volume"];
            "kmix"."decrease_volume_small" = ["Shift+PgDown" "Shift+Volume Down,Shift+Volume Down,Decrease Volume by 1%"];
            "kmix"."increase_volume" = ["Volume Up" "PgUp,Volume Up,Increase Volume"];
            "kmix"."increase_volume_small" = ["Shift+Volume Up" "Shift+PgUp,Shift+Volume Up,Increase Volume by 1%"];
            "kmix"."mute" = ["Volume Mute" "ScrollLock,Volume Mute,Mute"];
            "mediacontrol"."playpausemedia" = ["Pause" "Media Play,Media Play,Play/Pause media playback"];
            
            "kwin"."Kill Window" = "Meta+Ctrl+Esc";

            "kwin"."Grid View" = "Meta+Tab,Meta+G,Toggle Grid View";
            
            "kwin"."Switch One Desktop Down" = "Meta+Ctrl+Down";
            "kwin"."Switch One Desktop Up" = "Meta+Ctrl+Up";
            "kwin"."Switch One Desktop to the Left" = "Meta+Ctrl+Left";
            "kwin"."Switch One Desktop to the Right" = "Meta+Ctrl+Right";
            
            "kwin"."Walk Through Windows" = "Alt+Tab";
            "kwin"."Walk Through Windows (Reverse)" = "Alt+Shift+Backtab,Alt+Shift+Tab,Walk Through Windows (Reverse)";
            "kwin"."Window Close" = ["Alt+F4" "Meta+Q,Alt+F4,Close Window"];

            "kwin"."Window Fullscreen" = "none,,Make Window Fullscreen";
            
            "kwin"."view_actual_size" = "Meta+0";
            "kwin"."view_zoom_in" = ["Meta++" "Meta+=,Meta++" "Meta+=,Zoom In"];
            "kwin"."view_zoom_out" = "Meta+-";
            
            "plasmashell"."activate application launcher" = ["Meta,Meta" "Alt+F1,Activate Application Launcher"];
            
            "plasmashell"."activate task manager entry 1" = "Meta+1";
            "plasmashell"."activate task manager entry 2" = "Meta+2";
            "plasmashell"."activate task manager entry 3" = "Meta+3";
            "plasmashell"."activate task manager entry 4" = "Meta+4";
            "plasmashell"."activate task manager entry 5" = "Meta+5";
            "plasmashell"."activate task manager entry 6" = "Meta+6";
            "plasmashell"."activate task manager entry 7" = "Meta+7";
            "plasmashell"."activate task manager entry 8" = "Meta+8";
            "plasmashell"."activate task manager entry 9" = "Meta+9";
            "plasmashell"."activate task manager entry 10" = "none,Meta+0,Activate Task Manager Entry 10";
            
            "services/org.kde.spectacle.desktop"."CurrentMonitorScreenShot" = "Print";
            "services/org.kde.spectacle.desktop"."FullScreenScreenShot" = "Meta+Print";
            "services/org.kde.spectacle.desktop"."RectangularRegionScreenShot" = "Ctrl+Print";
            "services/org.kde.spectacle.desktop"."WindowUnderCursorScreenShot" = "Shift+Print";
        };
        configFile = {
            "dolphinrc"."General"."BrowseThroughArchives" = true;
            "dolphinrc"."General"."RememberOpenedTabs" = false;
            "dolphinrc"."General"."ShowFullPath" = true;
            "dolphinrc"."General"."ShowFullPathInTitlebar" = true;
            "dolphinrc"."General"."ShowSpaceInfo" = false;
            "dolphinrc"."General"."ShowZoomSlider" = false;
            "dolphinrc"."KFileDialog Settings"."Places Icons Auto-resize" = false;
            "dolphinrc"."KFileDialog Settings"."Places Icons Static Size" = 22;
            "dolphinrc"."PreviewSettings"."Plugins" = "audiothumbnail,blenderthumbnail,comicbookthumbnail,cursorthumbnail,djvuthumbnail,ebookthumbnail,exrthumbnail,directorythumbnail,fontthumbnail,imagethumbnail,jpegthumbnail,kraorathumbnail,windowsexethumbnail,windowsimagethumbnail,mobithumbnail,opendocumentthumbnail,gsthumbnail,rawthumbnail,svgthumbnail,ffmpegthumbs";
            
            "kcminputrc"."Mouse"."X11LibInputXAccelProfileFlat" = true;
            "kcminputrc"."Mouse"."cursorTheme" = "ArcAurora-cursors";
            
            "kdeglobals"."General"."AccentColor" = "61,212,37";
            "kdeglobals"."General"."LastUsedCustomAccentColor" = "61,212,37";
            "kdeglobals"."General"."XftAntialias" = true;
            "kdeglobals"."General"."XftHintStyle" = "hintfull";
            "kdeglobals"."General"."XftSubPixel" = "none";
            "kdeglobals"."Icons"."Theme" = "breeze";
            "kdeglobals"."KDE"."ShowDeleteCommand" = false;
            "kdeglobals"."KDE"."SingleClick" = false;
            "kdeglobals"."KDE"."widgetStyle" = "Breeze";
            
            "kdeglobals"."KFileDialog Settings"."Automatically select filename extension" = true;
            "kdeglobals"."KFileDialog Settings"."Show Full Path" = true;
            "kdeglobals"."KFileDialog Settings"."Show Inline Previews" = true;
            "kdeglobals"."KFileDialog Settings"."Show Preview" = false;
            "kdeglobals"."KFileDialog Settings"."Show hidden files" = false;
            "kdeglobals"."KFileDialog Settings"."Sort by" = "Name";
            "kdeglobals"."KFileDialog Settings"."Sort directories first" = true;
            
            "kdeglobals"."KScreen"."ScreenScaleFactors" = "HDMI-0=1.25;DP-0=1.25;DP-1=1.25;DP-2=1.25;DP-3=1.25;DP-4=1.25;DP-5=1.25;";
            
            "kdeglobals"."PreviewSettings"."EnableRemoteFolderThumbnail" = true;
            "kdeglobals"."PreviewSettings"."MaximumRemoteSize" = 31457280;

            "kiorc"."Confirmations"."ConfirmDelete" = true;
            "kiorc"."Confirmations"."ConfirmEmptyTrash" = true;
            "kiorc"."Confirmations"."ConfirmTrash" = false;

            "kiorc"."Executable scripts"."behaviourOnLaunch" = "alwaysAsk";

            "krunnerrc"."General"."FreeFloating" = true;
            "krunnerrc"."General"."RetainPriorSearch" = false;
            "krunnerrc"."Plugins"."konsoleprofilesEnabled" = false;
            "krunnerrc"."Plugins"."webshortcutsEnabled" = false;

            "kscreenlockerrc"."Greeter/Wallpaper/org.kde.image/General"."Image" = "/home/naharie/Pictures/wallpaper/2.jpg";
            "kscreenlockerrc"."Greeter/Wallpaper/org.kde.image/General"."PreviewImage" = "/home/naharie/Pictures/wallpaper/2.jpg";
            
            "kservicemenurc"."Show"."compressfileitemaction" = true;
            "kservicemenurc"."Show"."extractfileitemaction" = true;
            "kservicemenurc"."Show"."forgetfileitemaction" = true;
            "kservicemenurc"."Show"."installFont" = true;
            "kservicemenurc"."Show"."kactivitymanagerd_fileitem_linking_plugin" = true;
            "kservicemenurc"."Show"."kio-admin" = true;
            "kservicemenurc"."Show"."makefileactions" = true;
            "kservicemenurc"."Show"."mountisoaction" = true;
            "kservicemenurc"."Show"."movetonewfolderitemaction" = true;
            "kservicemenurc"."Show"."runInKonsole" = true;
            "kservicemenurc"."Show"."slideshowfileitemaction" = true;
            "kservicemenurc"."Show"."tagsfileitemaction" = true;
            "kservicemenurc"."Show"."wallpaperfileitemaction" = true;
            "ksmserverrc"."General"."loginMode" = "emptySession";
            "ksplashrc"."KSplash"."Theme" = "Vivid-Splash-6";

            "ktrashrc"."\\/home\\/naharie\\/.local\\/share\\/Trash"."UseSizeLimit" = false;
            "ktrashrc"."\\/home\\/naharie\\/.local\\/share\\/Trash"."UseTimeLimit" = false;

            "kwinrc"."Compositing"."AllowTearing" = false;
            "kwinrc"."Compositing"."LatencyPolicy" = "Medium";

            "kwinrc"."Desktops"."Id_1" = "63b5e64e-d944-42c3-a9d8-1afb89ae0a7f";
            "kwinrc"."Desktops"."Id_2" = "c138f045-0382-4549-931b-f4d2f7964d6c";
            "kwinrc"."Desktops"."Id_3" = "6259a689-278c-4096-ad14-8b9e3f4d1337";
            "kwinrc"."Desktops"."Id_4" = "2b4444ff-c69d-438a-aa53-6c3387da42f9";
            "kwinrc"."Desktops"."Id_5" = "5020d018-a2d8-4cbf-9f84-381a397a58a1";
            "kwinrc"."Desktops"."Id_6" = "ad354840-e30f-4267-8df5-d03718085ae6";
            "kwinrc"."Desktops"."Id_7" = "6211b6d0-9cb8-4d21-8c09-195c170db8a2";
            "kwinrc"."Desktops"."Id_8" = "673a8653-35c1-4ad3-8051-603a441c6e98";
            "kwinrc"."Desktops"."Id_9" = "3b3a4231-8df3-4844-b0b0-79866262a037";
            "kwinrc"."Desktops"."Number" = 9;
            "kwinrc"."Desktops"."Rows" = 3;

            "kwinrc"."EdgeBarrier"."CornerBarrier" = false;
            "kwinrc"."EdgeBarrier"."EdgeBarrier" = 0;
            "kwinrc"."Effect-hidecursor"."HideOnTyping" = true;

            "kwinrc"."NightColor"."Active" = true;

            "kwinrc"."NightColor"."LatitudeAuto" = 43.04;
            "kwinrc"."NightColor"."LongitudeAuto" = "-108.2";
            "kwinrc"."NightColor"."NightTemperature" = 3100;
            
            "kwinrc"."Plugins"."desktopchangeosdEnabled" = true;
            "kwinrc"."Plugins"."dimscreenEnabled" = true;
            "kwinrc"."Plugins"."hidecursorEnabled" = true;
            "kwinrc"."Plugins"."sticky-window-snappingEnabled" = true;
            
            "kwinrc"."Xwayland"."Scale" = 1.25;
            "kwinrc"."Xwayland"."XwaylandEavesdrops" = "Combinations";

            "kwinrc"."org.kde.kdecoration2"."ButtonsOnLeft" = "M";
            "kwinrc"."org.kde.kdecoration2"."ButtonsOnRight" = "IAX";
            
            "plasmanotifyrc"."Jobs"."PermanentPopups" = false;
            "plasmanotifyrc"."Notifications"."PopupPosition" = "BottomRight";
            "plasmanotifyrc"."Notifications"."PopupTimeout" = 1000;
            "plasmarc"."Wallpapers"."usersWallpapers" = "/home/naharie/Pictures/wallpaper/7.png,/home/naharie/Pictures/wallpaper/8.jpg,/home/naharie/Pictures/wallpaper/10.jpg";
        };
    };
}
