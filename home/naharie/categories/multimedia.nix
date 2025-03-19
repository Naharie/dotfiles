{ pkgs
, inputs
, ...
}:

let affinity-nix = inputs.affinity-nix; in

{
  home.packages = with pkgs; [
    darktable # Photo organization & raw photo editing
    imagemagick # Command line photo editing
    affinity-nix.packages.${pkgs.system}.photo # Photo editor

    vlc # Video player
    kdePackages.kdenlive # Video editor
    ffmpeg # Video converter
    yt-dlp # YouTube downloader
    makemkv # Bluray converter
    losslesscut-bin # Lossless video slicer

    puddletag # Music tag editor
    jellyfin-media-player # Jellyfin client
  ];
}