{
    pkgs,
    ...
}:

{
    users.users = {
        naharie = {
            isNormalUser = true;
            description = "Naharie";
            extraGroups = [ "networkmanager" "wheel" ];
            shell = pkgs.bash;
        };
    };

    security.sudo.extraRules = [
        {
            users = [ "naharie" ];
            commands = [ { command = "/home/naharie/scripts/proxy"; options = [ "NOPASSWD" ]; } ];
        }
    ];
}