{ pkgs, system, inputs, ... }:

# Repos
let affinity-nix = inputs.affinity-nix; in
let mur = import ../packages { inherit pkgs; }; in

# Utilities
let pin = import ../utilities/pin.nix system; in
# Vorta & Calibre: bafb3e4e13f24f9f665d4e4487c2ea597e65f23e - sha256:0mxa39d48f5xa8rhk5q4nc2km9qn2bwgbsm0skzlp0yaqazj3yml

{
  environment.systemPackages = with pkgs; (
    # Internet & Communication
    [
      brave
      protonmail-desktop

      webcord
      vesktop
      
      skypeforlinux
      signal-desktop

      localsend
      tun2socks
    ] ++
    # Documents, Secrets, and Planning
    [
      keepassxc
      qalculate-qt
      obsidian
      (pin "bafb3e4e13f24f9f665d4e4487c2ea597e65f23e" "sha256:0mxa39d48f5xa8rhk5q4nc2km9qn2bwgbsm0skzlp0yaqazj3yml").calibre
      todoist-electron
    ] ++
    # Text Editors
    [
      kate
      libreoffice
    ] ++
    # Photos
    [
      darktable
      imagemagick
      krita
      affinity-nix.packages.${system}.photo
    ] ++
    # Videos
    [
      vlc
      kdenlive
      ffmpeg

      (pkgs.wrapOBS {
        plugins = with pkgs.obs-studio-plugins; [
          obs-pipewire-audio-capture
        ];
      })

      yt-dlp
      makemkv
    ] ++
    # Music
    [
      puddletag
      elisa
    ] ++
    # Gaming
    [
      steam-run
      mur.proton-ge
      libtas
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
    ] ++
    # Utilities
    [
      #easyeffects

      vorta

      wine
      wine64

      fsearch
      partition-manager

      kdePackages.filelight
      kdePackages.ksystemlog
      kdePackages.plasma-browser-integration
      kdePackages.xdg-desktop-portal-kde

      android-tools

      bat
      eza
      git
      micro
      ddcutil
    ] ++
    # Hardware
    [
      ckb-next
    ]
  );

  services.flatpak.enable = true;
  services.flatpak.packages = [
    "io.github.everestapi.Olympus"
    "us.zoom.Zoom"
    "io.github.zen_browser.zen"
  ];
  services.flatpak.update.onActivation = true;

  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = false;
  };

  programs.kdeconnect.enable = false;
  programs.command-not-found.enable = false;
  programs.nix-index-database.comma.enable = true;

  programs.nix-index.enable = true;
  programs.nix-index.enableBashIntegration = true;

  services.dbus.enable = true;

  services.zerotierone = {
    enable = false;
    joinNetworks = [ "a84ac5c10a50e083" ];
  };

  services.murmur.enable = false;
  services.murmur.hostName = "valorium";
  services.murmur.password = "valorium";

  services.mysql.enable = true;
  services.mysql.package = pkgs.mariadb_114;
}
