{ ... }:

{
    home.stateVersion = "23.11";
    programs.home-manager.enable = true;

    imports = [ ./plasma.nix ];

    programs.git = {
        enable = true;
        userName  = "Naharie";
        userEmail = "naharie@pm.me";
    };

    programs.bash = {
        enable = true;
        shellAliases = {
            ls = "eza";
            cat = "bat";
        };
    };
}