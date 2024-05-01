{ ... }:

{
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

  imports = [
    #hyprland-nix.homeManagerModules.default
    #./hyprland.nix
  ];

  programs.git = {
    enable = true;
    userName  = "Naharie";
    userEmail = "oneofthosewhoescaped@gmail.com";
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      ls = "eza";
      cat = "bat";
      wine = "wine64";
    };
  };
}