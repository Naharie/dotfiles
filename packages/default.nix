{ pkgs ? import <nixpkgs> {} }:

{
    proton-ge = pkgs.callPackage ./proton-ge.nix {};
    dotnet-sdks = pkgs.callPackage ./dotnet-sdks.nix {};
}