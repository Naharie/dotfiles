{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    ################################
    # Web Browsers & Communication #
    ################################

    firefox
    brave

    discord
    webcord
    skypeforlinux
    mumble
    murmur
    mediamtx
    signal-desktop

    ##############################
    # Notes & Secrets & Planning #
    ##############################

    keepassxc
    qalculate-qt
    obsidian
    ledger
    libsForQt5.korganizer

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
    # Steam game version locking by making them packages
    # https://github.com/Siegema/nix-steam

    #######
    # CLI #
    #######

    bat
    eza
    git
    micro
    ddcutil

    ################
    # Text Editors #
    ################

    kate
    vscode
    jetbrains.rider
    #(pkgs.callPackage ./../derivations/godot-beta/package.nix { })
    godot_4
    libreoffice

    ############
    # Runtimes #
    ############

    wine64Packages.stableFull
    inputs.dotnet-sdks.packages.${system}.combinedSdk
    python3
    typescript
    nodejs_21
      corepack

    #############
    # Databases #
    #############

    beekeeper-studio
    mariadb_110

    ########
    # Misc #
    ########

    calibre
    ckb-next
    nil

    fsearch
    avalonia-ilspy
    # Backup Tool
    vorta
    filezilla

    zerotierone
    (callPackage ./../derivations/zerotier-gui/package.nix {})

    joycond

    partition-manager

    libsForQt5.kpmcore
    libsForQt5.filelight
    libsForQt5.ksystemlog

    # Tiling Window Managers
    # libsForQt5.bismuth
    # libsForQt5.polonium
    (callPackage ./../derivations/polonium.nix {})

    libsForQt5.plasma-browser-integration
    libsForQt5.qt5.qtwebsockets
    libsForQt5.kdeconnect-kde
    libsForQt5.xdg-desktop-portal-kde

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

  programs.command-not-found.enable = false;
  programs.nix-index.enableBashIntegration = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [];

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
