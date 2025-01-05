{ pkgs
, ...
}:

let mur = import ../../packages { inherit pkgs; }; in

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
      commands = [ { command = "${mur.phone-proxy}/bin/phone-proxy"; options = [ "NOPASSWD" ]; } ];
    }
  ];
}
