{ inputs, ... }:

# This file is very helpful in terms of seeing what a more real config might look like:
# https://github.com/nix-community/plasma-manager/blob/trunk/examples/home.nix

# To generate an auto config (useful for diffing):
# nix run github:nix-community/plasma-manager

{
    imports = [
        inputs.plasma-manager.homeManagerModules.plasma-manager
    ];

    programs.plasma = {
        enable = true;
        overrideConfig = true;

        panels = [
            {
                alignment = "center";
                lengthMode = "fill";
                location = "bottom";
                height = 46;

                widgets = [
                    {
                        kickoff = {
                            icon = "nix-snowflake-white";
                            sortAlphabetically = true;
                        };
                    }
                    {
                        iconTasks = {
                            launchers = [
                                "applications:io.github.zen_browser.zen.desktop"
                            ];
                            behavior.grouping.method = "none";
                        };
                    }
                    {
                        systemTray = {
                            icons.spacing = "large";
                            items = {
                                shown = [
                                    "org.kde.plasma.bluetooth"
                                    "org.kde.plasma.brightness"
                                ];
                                hidden = [
                                    "org.kde.plasma.powermanagement"
                                    "ckb-next_ckb-next"
                                ];
                            };
                        };
                    }
                    {
                        digitalClock = {
                            date = {
                                format = "isoDate";
                                position = "belowTime";
                            };

                            time = {
                                showSeconds = "onlyInTooltip";
                            };
                        };
                    }
                    {
                        name = "org.kde.plasma.minimizeall";
                        config.Shortcuts = { global = "Meta+M"; };
                    }
                ];
            }
        ];

        input = {
            mice = [
                {
                    name = "ckb1: CORSAIR HARPOON RGB PRO Gaming Mouse vM";
                    vendorId = "1b1c";
                    productId = "1b75";
                    
                    acceleration = 0;
                    accelerationProfile = "none";
                    scrollSpeed = 2.22;
                }
            ];
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
        };

        kscreenlocker = {
            appearance.wallpaper = "/home/naharie/Pictures/wallpaper/2.jpg";
            lockOnResume = true;
            lockOnStartup = true;
            passwordRequired = true;
        };

        kwin = {
            effects = {
                dimInactive.enable = true;
                desktopSwitching.animation = "slide";
                dimAdminMode.enable = true;
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

        powerdevil.AC = {
            autoSuspend.idleTimeout = null;
            dimDisplay.enable = false;
            powerButtonAction = "showLogoutScreen";
        };

        session = {
            general.askForConfirmationOnLogout = true;
            sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
        };

        workspace = {
            theme = "Breeze";
            colorScheme = "Andromeda";

            wallpaper = "/home/naharie/Pictures/wallpaper/10.jpg";
            wallpaperFillMode = "preserveAspectCrop";

            cursor.theme = "ArcAurora-cursors";
            splashScreen.theme = "Andromeda";
            iconTheme = "breeze";

            enableMiddleClickPaste = false;
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
                "view_zoom_in" = "Meta+}";
                "view_zoom_out" = "Meta+{";
            };

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
                "activate task manager entry 10" = "Meta+0";
            };

            "services/org.kde.dolphin.desktop" = { _launch = "Meta+E"; };
            "services/org.kde.krunner.desktop" = {
                _launch = builtins.concatStringsSep "\t" [ "Alt+Space" "Search" ];
            };
            "services/org.kde.konsole.desktop" = { _launch = "Meta+T"; };
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
            
            kcminputrc.Mouse.X11LibInputXAccelProfileFlat = true;
            
            kdeglobals = {
                General = {
                    AccentColor = "61,212,37";
                    LastUsedCustomAccentColor = "61,212,37";

                    XftAntialias = true;
                    XftHintStyle = "hintfull";
                    XftSubPixel = "none";
                };

                # Needed so we can use Page Up and Page Down for media control.
                Shortcuts = {
                    Next = "";
                    Prior = "";
                };

                KDE = {
                    ShowDeleteCommand = true;
                    SingleClick = false;
                    widgetStyle = "Breeze";
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

            ktrashrc = {
                "\\/home\\/naharie\\/.local\\/share\\/Trash".UseSizeLimit = false;
                "\\/home\\/naharie\\/.local\\/share\\/Trash".UseTimeLimit = false;
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
        appearance = {
            defaultView = "allAlbums";
            showNowPlayingBackground = true;
            showProgressOnTaskBar = true;
        };
        indexer = {
            paths = [ "$HOME/Music" ];
            scanAtStartup = true;
        };
    };
}
