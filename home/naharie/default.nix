{ pkgs
, inputs
, valLib
, ...
}:

let lib = inputs.nixpkgs.lib; in

{
  # https://askubuntu.com/questions/1086529/how-to-give-a-flatpak-app-access-to-a-directory
  # Flatpak permissions management

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

  imports = valLib.gatherImports ./.;

  home.sessionVariables = {
    PATH = lib.strings.concatStringsSep ":" [
      "$PATH"
      "$HOME/.dotnet/tools"
    ];
    EDITOR = "code --wait";
    # Do I need this with the new flatpak manager?
    XDG_DATA_DIRS = "$XDG_DATA_DIRS:$HOME/.local/share/flatpak/exports/share";
  };
  
  home.packages = with pkgs;
    [
      inputs.zen-browser.packages.${pkgs.system}.default # Web browser
      brave # Backup web browser

      inputs.nixpkgs-stable.legacyPackages.${pkgs.system}.vorta # Backup

      kdePackages.filelight # Disk space usage
      kdePackages.ksystemlog # System log viewer
      kdePackages.plasma-browser-integration # Web browser media control
      
      zoom
    ];
}