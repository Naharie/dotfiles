let pkgs = import <nixpkgs> { }; in

{
  kde-wallpaper-engine-backend = pkgs.libsForQt5.callPackage ./package.nix { };
}