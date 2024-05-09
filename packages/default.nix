{ pkgs ? import <nixpkgs> {} }:

{
  zerotier-gui = pkgs.callPackage ./zerotier-gui {};
  proton-ge = pkgs.callPackage ./proton-ge {};
  dotnet-sdks = pkgs.callPackage ./dotnet-sdks {};

  godot-bleeding = pkgs.callPackage ./godot-bleeding {};
}