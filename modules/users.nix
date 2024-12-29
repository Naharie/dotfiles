{ pkgs, ... }:

{
    users.users = {
        naharie = {
            isNormalUser = true;
            description = "Naharie";
            extraGroups = [ "networkmanager" "wheel" ];
            shell = pkgs.bash;
        };

        tiredpaperartist = {
            isNormalUser = true;
            description = "TiredPaperArtist";
            extraGroups = [ "networkmanager" ];
            shell = pkgs.bash;
        };
    };

    security.sudo.extraRules = [
        {
            users = [ "naharie" ];
            commands = [ { command = "/home/naharie/scripts/proxy"; options = [ "NOPASSWD" ]; } ];
        }

        {
            users = [ "tiredpaperartist" ];
            commands = [ { command = "/home/tiredpaperartist/proxy"; options = [ "NOPASSWD" ]; } ];
        }
    ];
}