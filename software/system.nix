{ pkgs, ... }:

{
  packages = with pkgs; [
    kate
    micro
    fsearch

    timeshift

    ddcutil
    joycond

    partition-manager
    libsForQt5.kpmcore

    libsForQt5.filelight
    libsForQt5.ksystemlog

    libsForQt5.plasma-browser-integration
    libsForQt5.qt5.qtwebsockets
    lightly-qt

    #(libsForQt5.callPackage ../derivations/kde-wallpaper-engine-backend/package.nix {})
  ];
}