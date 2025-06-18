{
  pkgs
}:

builtins.mapAttrs (n: v: pkgs.callPackage v {}) {
  arcaurora-cursors = ./arcaurora-cursors.nix;
  andromeda-theme = ./andromeda-theme.nix;

  dotnet-publish = ./dotnet-publish.nix;
  phone-proxy = ./phone-proxy;

  zerotier-gui = ./zerotier-gui.nix;

  vial-udev = ./vial-udev;
  nxdumptool-udev = ./nxdumptool-udev;
}
