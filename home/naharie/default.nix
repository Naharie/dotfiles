{ pkgs
, system
, inputs
, ...
}:

let affinity-nix = inputs.affinity-nix; in

let

  lib = inputs.nixpkgs.lib;

in

{
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
    ./plasma
  ] ++ import ./programs;

  home.sessionVariables = {
    PATH = lib.strings.concatStringsSep ":" [
      "$PATH"
      "$HOME/.dotnet/tools"
    ];
    EDITOR = "code --wait";
  };

  home.packages = with pkgs;
    [
      # Internet & Communication

      inputs.zen-browser.packages.${system}.default

      webcord
      vesktop
      skypeforlinux
      signal-desktop
      localsend
      tun2socks

      # Documents, Secrets, and Planning

      keepassxc
      qalculate-qt
      obsidian
      inputs.nixpkgs-stable.legacyPackages.${system}.calibre
      todoist-electron

      # Text Editors

      libreoffice

      # Photos

      darktable
      imagemagick
      krita
      affinity-nix.packages.${system}.photo

      # Videos

      vlc
      kdenlive
      ffmpeg
      yt-dlp
      makemkv

      # Music

      puddletag

      # Gaming

      libtas
      itch

      # Programming

      nixpkgs-fmt
      jetbrains.rider
      jetbrains.rust-rover
      godot_4
      dotnetCorePackages.sdk_9_0
      typescript
      nodejs
      corepack
      avalonia-ilspy

      # Utilities

      timeshift
      fsearch
      partition-manager
      kdePackages.filelight
      kdePackages.ksystemlog
      kdePackages.plasma-browser-integration
    ];

  services.flatpak = {
    enable = true;
    packages = [
      "io.github.everestapi.Olympus"
      "us.zoom.Zoom"
    ];
    update.onActivation = true;
  };
}
