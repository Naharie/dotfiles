{
  pkgs
}:

{
  arcaurora-cursors = pkgs.callPackage ./arcaurora-cursors.nix {};
  andromeda-theme = pkgs.callPackage ./andromeda-theme.nix {};

  dotnet-publish = pkgs.callPackage ./dotnet-publish.nix {};
  phone-proxy = pkgs.callPackage ./phone-proxy {};

  zerotier-gui = pkgs.callPackage ./zerotier-gui.nix {};

  vial-udev = pkgs.callPackage ./vial-udev {};
  nxdumptool-udev = pkgs.callPackage ./nxdumptool-udev {};
}
