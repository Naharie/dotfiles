let pkgs = import <nixpkgs> { }; in

{
  godot-beta = pkgs.callPackage ./godot-beta.nix { };
}