{ pkgs
, inputs
, ...
}:

let affinity-nix = inputs.affinity-nix; in

let
  lib = inputs.nixpkgs.lib;
  mur = import ../../packages { inherit pkgs; };
in

{
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

  imports = [ ./plasma ] ++ import ./programs ++ import ./services;

  home.sessionVariables = {
    PATH = lib.strings.concatStringsSep ":" [
      "$PATH"
      "$HOME/.dotnet/tools"
    ];
    EDITOR = "code --wait";
    XDG_DATA_DIRS = lib.strings.concatStringsSep ":" [
      "/var/lib/flatpak/exports/share"
      "/home/naharie/.local/share/flatpak/exports/share"
    ];
  };

  home.packages = with pkgs;
    [
      inputs.zen-browser.packages.${pkgs.system}.default # Web browser
      brave # Backup web browser

      webcord # Discord client
      vesktop # Discord client for streaming
      skypeforlinux
      signal-desktop
      localsend # Share files with phone and tablet

      proton-pass # Password manager
      qalculate-qt # Calculator
      obsidian # Notes
      inputs.nixpkgs-stable.legacyPackages.${pkgs.system}.calibre # Ebooks
      todoist-electron # To-do list

      libreoffice # Word docs and spreadsheets

      # Photos

      darktable # Photo organization & raw photo editing
      imagemagick # Command line photo editing
      affinity-nix.packages.${pkgs.system}.photo # Photo editor

      vlc # Video player
      kdenlive # Video editor
      ffmpeg # Video converter
      yt-dlp # YouTube downloader
      makemkv # Bluray converter

      puddletag # Music tag editor

      libtas # TAS for linux native games
      itch # itch.io client

      # Programming
      
      jetbrains.rider # Code editor for .NET
      avalonia-ilspy # IL viewer
      
      jetbrains.rust-rover # Code editor for Rust
      
      godot_4

      timeshift # Personal file backup
      kdePackages.filelight # Disk space usage
      kdePackages.ksystemlog # System log viewer
      kdePackages.plasma-browser-integration # Web browser media control

      dotnet-sdk_9
      mur.dotnet-publish
    ];
}
