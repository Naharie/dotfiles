{ pkgs ? import <nixpkgs> { } }:

{
  zerotier-gui = pkgs.callPackage ./zerotier-gui {};
  proton-ge = pkgs.callPackage ./proton-ge {};

  # Temporary packages until the main repo is updated
  polonium = pkgs.callPackage ./polonium {};
  godot-beta = pkgs.callPackage ./godot-beta {};
}