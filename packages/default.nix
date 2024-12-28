{ pkgs ? import <nixpkgs> {} }:

{
    zerotier-gui = pkgs.callPackage ./zerotier-gui {};
    proton-ge = pkgs.callPackage ./proton-ge {};
    dotnet-sdks = pkgs.callPackage ./dotnet-sdks {};

    #signon-plugin-oauth2 = pkgs.callPackage ./signon-plugin-oauth2 {};
}