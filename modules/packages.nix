{ pkgs, inputs, ... }:

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
    vscode
    jetbrains.rider
    #(pkgs.callPackage ./../derivations/godot-beta/package.nix { })
    godot_4

    ############
    # Runtimes #
    ############

    wine64Packages.stableFull
    inputs.dotnet-sdks.packages.${system}.combinedSdk
    python3
    typescript
    nodejs_21
      corepack

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

  services.dbus.enable = true;

  services.zerotierone = {
    enable = true;
    joinNetworks = [ "a84ac5c10a50e083" ];
  };

  services.murmur.enable = true;
  services.murmur.hostName = "valorium";
  services.murmur.password = "valorium";
}
