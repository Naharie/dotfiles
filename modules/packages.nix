{ pkgs, ... }:

let mur = import ../packages { inherit pkgs; }; in

{
  environment.systemPackages = with pkgs; (
    # Networking 
    [
      firefoxpwa
      brave

      discord
      webcord
      skypeforlinux
      mumble
      murmur
      mediamtx
      signal-desktop
      #zoom-us

      zerotierone
      mur.zerotier-gui

      # Remote file management
      filezilla
    ] ++
    # Notes, secrets, and planning
    [
      keepassxc
      qalculate-qt
      obsidian
      calibre
      kmymoney
    ] ++
    # Text Editors
    [
      kate
      libreoffice
    ] ++
    # Photos
    [
      darktable
      #libresprite
      gimp
      imagemagick
      krita
    ] ++
    # Videos
    [
      vlc
      olive-editor
      ffmpeg

      (pkgs.wrapOBS {
        plugins = with pkgs.obs-studio-plugins; [
          obs-pipewire-audio-capture
        ];
      })

      yt-dlp
    ] ++
    # Music
    [
      puddletag
      elisa
      #musescore
    ] ++
    # Gaming
    [
      steam-run
      prismlauncher
      lutris
      heroic
      mur.proton-ge
    ] ++
    # Programming
    [
      vscode
      jetbrains.rider
      jetbrains.rust-rover

      godot_4

      mur.dotnet-sdks
      typescript
      nodejs
        corepack
      
      avalonia-ilspy
      nil

      # TODO: Update later
      #beekeeper-studio
    ] ++
    # Utilities
    [
      easyeffects

      mission-center
      coolercontrol.coolercontrol-gui
        # Do I need to manually specify these?
        # Probably not, but doesn't hurt to be safe.
        coolercontrol.coolercontrold
        coolercontrol.coolercontrol-ui-data
        coolercontrol.coolercontrol-liqctld

      nvtopPackages.full

      wine
      wine64
      fsearch
      partition-manager
      vorta

      kdePackages.filelight
      kdePackages.ksystemlog
      kdePackages.plasma-browser-integration
      kdePackages.xdg-desktop-portal-kde

      bat
      eza
      git
      micro
      ddcutil
      comma
    ] ++
    # Hardware
    [
      ckb-next
    ]
  );

  services.flatpak.enable = true;
  services.flatpak.packages = [
    "io.github.congard.qnvsm"
    "io.github.everestapi.Olympus"
    #"us.zoom.Zoom"
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

  programs.nix-index.enable = true;
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
}
