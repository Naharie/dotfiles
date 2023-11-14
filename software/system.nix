{ pkgs, ddcutil-backend, ... }:

{
  packages = with pkgs; [
    kate
    micro
    fsearch

    timeshift
    
    ddcutil
    ddcutil-backend.packages.${system}.ddcutil-backend

    libsForQt5.plasma-browser-integration
    libsForQt5.ksystemlog
    lightly-qt
  ];
}