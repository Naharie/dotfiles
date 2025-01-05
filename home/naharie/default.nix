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

  imports = [ ./plasma ] ++ import ./programs;

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

      brave
      inputs.zen-browser.packages.${system}.default

      webcord
      vesktop
      skypeforlinux
      signal-desktop
      localsend

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
      
      jetbrains.rust-rover
      
      jetbrains.rider
      avalonia-ilspy
      
      godot_4

      # Utilities

      timeshift
      fsearch
      partition-manager
      kdePackages.filelight
      kdePackages.ksystemlog
      kdePackages.plasma-browser-integration
    ];
}
