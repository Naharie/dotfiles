{ pkgs, inputs, ... }:

let mur = import ../packages { inherit pkgs; }; in

{
  environment.systemPackages = with pkgs; [
    ##############
    # Networking #
    ##############

    firefox
    brave

    discord
    webcord
    skypeforlinux
    mumble
    murmur
    mediamtx
    signal-desktop

    zerotierone
    mur.zerotier-gui

    # Remote file management
    filezilla

    ##############################
    # Notes & Secrets & Planning #
    ##############################

    keepassxc
    qalculate-qt
    obsidian
    super-productivity
    
    # EBooks
    #calibre
    
    # Finances
    denaro

    ##############
    # Multimedia #
    ##############

    # Photos
    darktable
    libresprite
    gimp
    imagemagick
    krita

    # Videos
    vlc
    mpv
    kdenlive
    ffmpeg

    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        input-overlay
        obs-pipewire-audio-capture
      ];
    })

    yt-dlp

    # Music
    puddletag
    amberol

    ##########
    # Gaming #
    ##########

    steam-run
    minecraft
    lutris
    heroic
    mur.proton-ge

    # Steam game version locking by making them packages
    # https://github.com/Siegema/nix-steam

    ################
    # Text Editors #
    ################

    kate
    libreoffice

    ###############
    # Programming #
    ###############

    # Code Editors
    vscode
    jetbrains.rider

    # Languages / Runtimes
    mur.godot-bleeding

    wine64Packages.stableFull
    inputs.dotnet-sdks.packages.${system}.combinedSdk
    python3
    typescript
    nodejs
      corepack
    
    # Utilities
    avalonia-ilspy
    nil

    #############
    # Databases #
    #############

    beekeeper-studio
    mariadb_110

    ########
    # Misc #
    ########

    ckb-next

    fsearch

    ####################
    # System Utilities #
    ####################

    partition-manager

    # Backup
    vorta

    #joycond

    libsForQt5.kpmcore
    libsForQt5.filelight
    libsForQt5.ksystemlog

    # Tiling Window Managers
    # libsForQt5.bismuth
    # libsForQt5.polonium

    libsForQt5.plasma-browser-integration
    libsForQt5.qt5.qtwebsockets
    libsForQt5.kdeconnect-kde
    libsForQt5.xdg-desktop-portal-kde

    # Command Line Utilities
    bat
    eza
    git
    micro
    ddcutil
    comma

    #################
    # System Tweaks #
    #################

    kde-rounded-corners
    lightly-qt
  ];

  services.flatpak.enable = true;
  services.flatpak.packages = [
    "io.github.congard.qnvsm"
    "io.github.everestapi.Olympus"
    "us.zoom.Zoom"
  ];
  services.flatpak.update.onActivation = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = false;
  };

  programs.kdeconnect.enable = true;
  programs.command-not-found.enable = false;
  programs.nix-index.enableBashIntegration = true;

  #programs.nix-ld.enable = true;
  #programs.nix-ld.libraries = with pkgs; [];

  services.dbus.enable = true;

  services.zerotierone = {
    enable = true;
    joinNetworks = [ "a84ac5c10a50e083" ];
  };

  services.murmur.enable = true;
  services.murmur.hostName = "valorium";
  services.murmur.password = "valorium";

  services.mysql.enable = true;
  services.mysql.package = pkgs.mariadb_110;
}
