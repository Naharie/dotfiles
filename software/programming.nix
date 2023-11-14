{ pkgs, dotnet-sdks, ... }:

{
  packages = with pkgs; [
    # Code Editors
    vscode
    jetbrains.rider

    # Runtimes
    dotnet-sdks.packages.${system}.combinedSdk

    # Language Servers
    nil

    git
  ];
}