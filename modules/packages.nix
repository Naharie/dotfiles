{ pkgs, ... }:

let mur = import ../packages { inherit pkgs; }; in

{
  environment.systemPackages = with pkgs; [
    ##############
    # Networking #
    ##############

    #firefox
    firefoxpwa
    brave

    discord
    webcord
    skypeforlinux
    mumble
    murmur
    mediamtx
    signal-desktop
    zoom-us

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
    
    # EBooks
    calibre

    # Finances
    kmymoney

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
        obs-pipewire-audio-capture
      ];
    })

    yt-dlp

    # Music
    puddletag
    elisa

    ##########
    # Gaming #
    ##########

    steam-run
    #minecraft
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
    #mur.godot-bleeding
    godot_4

    wine
    wine64

    mur.dotnet-sdks
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

    wlx-overlay-s

    # Backup
    vorta

    #joycond

    kdePackages.kpmcore
    kdePackages.filelight
    kdePackages.ksystemlog

    kdePackages.plasma-browser-integration
    kdePackages.xdg-desktop-portal-kde

    # Command Line Utilities
    bat
    eza
    git
    micro
    ddcutil
    comma
    nix-index

    #################
    # System Tweaks #
    #################

    kde-rounded-corners
    #lightly-qt
  ];

  nixpkgs.overlays = [
    #(import ../overlays/kwin-explicit-sync pkgs)
  ];

  services.flatpak.enable = true;
  services.flatpak.packages = [
    "io.github.congard.qnvsm"
    "io.github.everestapi.Olympus"
  ];
  services.flatpak.update.onActivation = true;

  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    nativeMessagingHosts.packages = [ pkgs.firefoxpwa ];
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = false;
  };

  programs.kdeconnect.enable = true;
  programs.command-not-found.enable = false;
  programs.nix-index.enableBashIntegration = true;

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

  services.joycond.enable = true;
}
