{ plasma-manager, ... }:

{
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
  imports = [
    plasma-manager.homeManagerModules.plasma-manager
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
    };
  };
}