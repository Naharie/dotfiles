{ pkgs, dotnet-sdks, ... }:

{
  packages = with pkgs; [
    # Code Editors
    vscodium
    jetbrains.rider

    # Runtimes
    dotnet-sdks.packages.${system}.combinedSdk
    python3

    # Packages
    python311Packages.websockets

    # Language Servers
    nil

    git
  ];
}