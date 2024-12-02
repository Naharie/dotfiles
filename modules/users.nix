{ pkgs, ... }:

{
  users.users.naharie = {
    isNormalUser = true;
    description = "Naharie";
    extraGroups = [ "networkmanager" "wheel" "i2c" ];
    shell = pkgs.bash;
  };

  users.users.tiredpaperartist = {
    isNormalUser = true;
    description = "TiredPaperArtist";
    extraGroups = [ "networkmanager" "wheel" "i2c" ];
    shell = pkgs.bash;
  };
}