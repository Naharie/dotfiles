{ pkgs
, ...
}:

{
  users.users = {
    tiredpaperartist = {
      isNormalUser = true;
      description = "TiredPaperArtist";
      extraGroups = [ "networkmanager" ];
      shell = pkgs.bash;
    };
  };

  security.sudo.extraRules = [
    {
      users = [ "tiredpaperartist" ];
      commands = [{ command = "/home/tiredpaperartist/proxy"; options = [ "NOPASSWD" ]; }];
    }
  ];
}
