{ pkgs, ... }:

{
  packages = with pkgs; [
    # Photos
    darktable
    libresprite
    gimp
    imagemagick

    # Videos
    vlc
    kdenlive
    obs-studio

    # Music
    puddletag
    strawberry
  ];
}