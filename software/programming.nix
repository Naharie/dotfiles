{ pkgs, dotnet-sdks, ... }:

{
  packages = with pkgs; [
    # Code Editors
    vscodium
    jetbrains.rider
    (pkgs.callPackage ./../derivations/godot-beta/godot-beta.nix { })
    #godot_4

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