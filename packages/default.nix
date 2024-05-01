{ pkgs ? import <nixpkgs> {} }:

{
  zerotier-gui = pkgs.callPackage ./zerotier-gui {};
  proton-ge = pkgs.callPackage ./proton-ge {};
  canon-cups-ufr2 = pkgs.callPackage ./canon-cups-ufr2 {};

  godot-bleeding = pkgs.callPackage ./godot-bleeding {};
}