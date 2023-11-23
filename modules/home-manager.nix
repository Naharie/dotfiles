{ ... }:

{
  home-manager.users.naharie = {
    home.stateVersion = "23.11";
    programs.home-manager.enable = true;

    programs.git = {
      enable = true;
      userName  = "Naharie";
      userEmail = "oneofthosewhoescaped@gmail.com";
    };

    programs.eza.enableAliases = true;
  };
}