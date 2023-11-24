let pkgs = import <nixpkgs> { }; in

{
  zerotier-gui = pkgs.callPackage ./package.nix { };
}