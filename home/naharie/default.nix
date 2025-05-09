{ pkgs
, inputs
, ...
}:

let lib = inputs.nixpkgs.lib; in

{
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

  imports = [
    ./categories
    ./plasma
    ./programs
    ./services
  ];

  home.sessionVariables = {
    PATH = lib.strings.concatStringsSep ":" [
      "$PATH"
      "$HOME/.dotnet/tools"
    ];
    EDITOR = "code --wait";
  };

  home.packages = with pkgs;
    [
      inputs.zen-browser.packages.${pkgs.system}.default # Web browser
      microsoft-edge # Backup web browser

      inputs.nixpkgs-stable.legacyPackages.${pkgs.system}.vorta # Backup

      kdePackages.filelight # Disk space usage
      kdePackages.ksystemlog # System log viewer
      kdePackages.plasma-browser-integration # Web browser media control
      
      zoom
    ];
}
