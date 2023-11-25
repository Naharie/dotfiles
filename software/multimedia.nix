{ pkgs, ... }:

{
  packages = with pkgs; [
    # Photos
    darktable
    libresprite
    gimp
    imagemagick
    krita

    # Videos
    vlc
    kdenlive
    obs-studio
    ffmpeg

    # Music
    puddletag
    strawberry
  ];
}