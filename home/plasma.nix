{ ... }:

# https://github.com/nix-community/plasma-manager/blob/trunk/examples/home.nix

{
    programs.plasma = {
        enable = true;
        overrideConfig = true;

        input = {
            mice = {
                "ckb1: CORSAIR HARPOON RGB PRO Gaming Mouse vM" = {
                    name = "ckb1: CORSAIR HARPOON RGB PRO Gaming Mouse vM";
                    vendorId = "1b1c";
                    productId = "1b75";
                    
                    acceleration = 0;
                    accelerationProfile = "none";
                    scrollSpeed = 5;
                };
            };
        };

        krunner = {
            activateWhenTypingOnDesktop = true;
            historyBehavior = "enableSuggestions";
            position = "center";
        };

        spectacle.shortcuts = {
            captureEntireDesktop = "Print";
            captureWindowUnderCursor = "Shift+Print";
            captureRectangularRegion = "Ctrl+Print";

            "services/org.kde.spectacle.desktop"."RectangularRegionScreenShot" = "Ctrl+Print";
            "services/org.kde.spectacle.desktop"."WindowUnderCursorScreenShot" = "Shift+Print";
        };

        kscreenlocker = {
            appearance.wallpaper = "/home/naharie/Pictures/wallpaper/2.jpg";
            lockOnResume = true;
            lockOnStartup = true;
            passwordRequired = true;
        };

        kwin = {
            effects = {
                desktopSwitching.animation = "slide";
                dimAdminMode.enable = true;
                dimInactive.enable = true;
                shakeCursor.enable = true;
            };

            nightLight = {
                enable = true;
                mode = "location";

                location = {
                    latitude = "43.04";
                    longitude = "-108.2";
                };

                temperature.night = 3100;
            };

            titlebarButtons.left = [ "more-window-actions" ];
            titlebarButtons.right = [ "minimize" "maximize" "close" ];

            virtualDesktops = {
                number = 9;
                rows = 3;
            };
        };

        panels = [
            {
                alignment = "center";
                lengthMode = "fill";
                location = "bottom";
                height = 46;

                widgets = [
                    "org.kde.plasma.kickoff"
                    "org.kde.plasma.icontasks"
                    "org.kde.plasma.systemtray"
                    "org.kde.plasma.digitalclock"
                    "org.kde.plasma.showdesktop"
                ];
            }
        ];

        powerdevl.AC = {
            autoSuspend.idleTimeout = null;
            dimDisplay.enable = false;
            powerButtonAction = "showLogoutScreen";
        };

        session = {
            general.askForConfirmationOnLogout = true;
            sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
        };

        workspace = {
            wallpaper = "/home/naharie/Pictures/wallpaper/10.jpg";
            wallpaperFillMode = "preserveAspectCrop";

            cursor.theme = "ArcAurora-cursors";
            splashScreen.theme = "Vivid-Splash-6";
        };

        shortcuts = {
            kmix = {
                decrease_volume = ["Volume Down" "PgDown,Volume Down,Decrease Volume"];
                decrease_volume_small = ["Shift+PgDown" "Shift+Volume Down,Shift+Volume Down,Decrease Volume by 1%"];
                increase_volume = ["Volume Up" "PgUp,Volume Up,Increase Volume"];
                increase_volume_small = ["Shift+Volume Up" "Shift+PgUp,Shift+Volume Up,Increase Volume by 1%"];
                mute = ["Volume Mute" "ScrollLock,Volume Mute,Mute"];
            };
            mediacontrol.playpausemedia = ["Pause" "Media Play,Media Play,Play/Pause media playback"];
            
            kwin = {
                "Kill Window" = "Meta+Ctrl+Esc";

                "Grid View" = "Meta+Tab,Meta+G,Toggle Grid View";
                
                "Switch One Desktop Up" = "Meta+Ctrl+Up";
                "Switch One Desktop Down" = "Meta+Ctrl+Down";
                "Switch One Desktop to the Left" = "Meta+Ctrl+Left";
                "Switch One Desktop to the Right" = "Meta+Ctrl+Right";
                
                "Walk Through Windows" = "Alt+Tab";
                "Walk Through Windows (Reverse)" = "Alt+Shift+Backtab,Alt+Shift+Tab,Walk Through Windows (Reverse)";
                "Window Close" = ["Alt+F4" "Meta+Q,Alt+F4,Close Window"];

                "Window Fullscreen" = "none,,Make Window Fullscreen";
                
                "view_actual_size" = "Meta+0";
                "view_zoom_in" = ["Meta++" "Meta+=,Meta++" "Meta+=,Zoom In"];
                "view_zoom_out" = "Meta+-";
            };

            plasmashell = {
                "activate application launcher" = ["Meta,Meta" "Alt+F1,Activate Application Launcher"];
                "activate task manager entry 1" = "Meta+1";
                "activate task manager entry 2" = "Meta+2";
                "activate task manager entry 3" = "Meta+3";
                "activate task manager entry 4" = "Meta+4";
                "activate task manager entry 5" = "Meta+5";
                "activate task manager entry 6" = "Meta+6";
                "activate task manager entry 7" = "Meta+7";
                "activate task manager entry 8" = "Meta+8";
                "activate task manager entry 9" = "Meta+9";
                "activate task manager entry 10" = "none,Meta+0,Activate Task Manager Entry 10";
            };
        };

        configFile = {
            dolphinrc = {
                General = {
                    BrowseThroughArchives = true;
                    RememberOpenedTabs = false;
                    ShowFullPath = true;
                    ShowFullPathInTitlebar  = true;
                    ShowSpaceInfo = false;
                    ShowZoomSlider = false;
                };
                "KFileDialog Settings" = {
                    "Places Icons Auto-resize" = false;
                    "Places Icons Static Size" = 22;
                };
                PreviewSettings.Plugins = "audiothumbnail,blenderthumbnail,comicbookthumbnail,cursorthumbnail,djvuthumbnail,ebookthumbnail,exrthumbnail,directorythumbnail,fontthumbnail,imagethumbnail,jpegthumbnail,kraorathumbnail,windowsexethumbnail,windowsimagethumbnail,mobithumbnail,opendocumentthumbnail,gsthumbnail,rawthumbnail,svgthumbnail,ffmpegthumbs";
            };
            
            "kcminputrc"."Mouse"."X11LibInputXAccelProfileFlat" = true;
            
            kdeglobals = {
                General = {
                    AccentColor = "61,212,37";
                    LastUsedCustomAccentColor = "61,212,37";

                    XftAntialias = true;
                    XftHintStyle = "hintfull";
                    XftSubPixel = "none";
                };

                Icons.Theme = "breeze";

                KDE = {
                    ShowDeleteCommand = true;
                    SingleClick = false;
                    widgetStyle = "Breeze";
                };

                "KFileDialog Settings" = {
                    "Automatically select filename extension" = true;
                    "Show Full Path" = true;
                    "Show Inline Previews" = true;
                    "Show Preview" = true;
                    "Show hidden files" = false;
                    "Sort by" = "Name";
                    "Sort directories first" = true;
                };

                KScreen.ScreenScaleFactors = "HDMI-0=1.25;DP-0=1.25;DP-1=1.25;DP-2=1.25;DP-3=1.25;DP-4=1.25;DP-5=1.25;";

                PreviewSettings = {
                    EnableRemoteFolderThumbnail = true;
                    MaximumRemoteSize = 31457280;
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

            krunnerrc.Plugins = {
                konsoleprofilesEnabled = false;
                webshortcutsEnabled = false;
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

            "ktrashrc"."\\/home\\/naharie\\/.local\\/share\\/Trash"."UseSizeLimit" = false;
            "ktrashrc"."\\/home\\/naharie\\/.local\\/share\\/Trash"."UseTimeLimit" = false;

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
            };

            plasmanotifyrc = {
                Jobs.PermanentPopups = false;
                Notifications = {
                    PopupPosition = "BottomRight";
                    PopupTimeout = 1000;
                };
            };
        };
    };

    programs.elisa = {
        enable = true;
        defaultView = "allAlbums";
        appearance = {
            showNowPlayingBackground = true;
            showProgressOnTaskBar = true;
        };
        indexer = {
            paths = [ "$HOME/Music" ];
            scanAtStartup = true;
        };
    };
}
