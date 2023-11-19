let pkgs = import <nixpkgs> { }; in

{
  godot-beta = pkgs.callPackage ./package.nix { };
}