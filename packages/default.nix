{ pkgs ? import <nixpkgs> {} }:

{
    proton-ge = pkgs.callPackage ./proton-ge.nix {};
    dotnet-sdks = pkgs.callPackage ./dotnet-sdks.nix {};

    arcaurora-cursors = pkgs.callPackage ./arcaurora-cursors.nix {};
    andromeda-theme = pkgs.callPackage ./andromeda-theme.nix {};
}