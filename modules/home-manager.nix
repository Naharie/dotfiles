{ config, pkgs, home-manager, ... }:

{
  home-manager.users.my_username = {
    home.stateVersion = "1.0";
  };

  programs.git = {
    enable = true;
    userName  = "Naharie";
    userEmail = "oneofthosewhoescaped@gmail.com";
  };
}