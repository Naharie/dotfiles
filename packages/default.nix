{ pkgs ? import <nixpkgs> {} }:

{
  zerotier-gui = pkgs.callPackage ./zerotier-gui {};
  proton-ge = pkgs.callPackage ./proton-ge {};
  dotnet-sdks = pkgs.callPackage ./dotnet-sdks {};
  monento = pkgs.callPackage ./monento {};

  #signon-plugin-oauth2 = pkgs.callPackage ./signon-plugin-oauth2 {};
  #godot-bleeding = pkgs.callPackage ./godot-bleeding {};
}