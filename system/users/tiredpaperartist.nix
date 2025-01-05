{ pkgs
, ...
}:

let
  username = "tiredpaperartist";
in

{
  users.users = {
    ${username} = {
      isNormalUser = true;
      description = "TiredPaperArtist";
      extraGroups = [ "networkmanager" ];
      shell = pkgs.bash;
    };
  };
}
