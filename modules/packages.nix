{ pkgs, dotnet-sdks, ... }@input:

{
  environment.systemPackages = with pkgs; [
    ################################
    # Web Browsers & Communication #
    ################################

    firefox
    brave

    #webcord
    discord
    skypeforlinux
    mumble
    murmur
    mediamtx

    ##############################
    # Notes & Secrets & Planning #
    ##############################

    keepassxc
    qalculate-qt
    obsidian
    ledger
    gnome.gnome-calendar

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
    obs-studio
    ffmpeg

    # Music
    puddletag
    amberol
    museeks

    ##########
    # Gaming #
    ##########

    steam-run
    #minecraft

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
    vscodium
    jetbrains.rider
    #(pkgs.callPackage ./../derivations/godot-beta/package.nix { })
    godot_4

    ############
    # Runtimes #
    ############

    wine64Packages.stableFull
    dotnet-sdks.packages.${system}.combinedSdk
    python3

    ########
    # Misc #
    ########

    calibre
    ckb-next
    nil

    fsearch
    avalonia-ilspy
    timeshift

    zerotierone
    (callPackage ./../derivations/zerotier-gui/package.nix {})

    joycond

    partition-manager

    libsForQt5.kpmcore
    libsForQt5.filelight
    libsForQt5.ksystemlog
    libsForQt5.bismuth
    libsForQt5.plasma-browser-integration
    libsForQt5.qt5.qtwebsockets
    libsForQt5.kdeconnect-kde
    libsForQt5.xdg-desktop-portal-kde

    kde-rounded-corners
    lightly-qt
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = false;
  };

  programs.command-not-found.enable = false;
  programs.nix-index.enableBashIntegration = true;
}
