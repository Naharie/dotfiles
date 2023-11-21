{ ... }:

{
  home-manager.users.naharie = {
    home.stateVersion = "23.11";

    programs.git = {
      enable = true;
      userName  = "Naharie";
      userEmail = "oneofthosewhoescaped@gmail.com";
    };

    programs.home-manager.enable = true;
  };
}