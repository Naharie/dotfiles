{ pkgs, ... }:

{
  packages = with pkgs; [
    kate
    micro
    fsearch

    timeshift
    
    ddcutil

    libsForQt5.plasma-browser-integration
    libsForQt5.ksystemlog
    lightly-qt
  ];
}