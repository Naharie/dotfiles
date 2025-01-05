{ pkgs
, ...
}:

let
  username = "naharie";
in

{
  users.users = {
    ${username} = {
      isNormalUser = true;
      description = "Naharie";
      extraGroups = [ "networkmanager" "wheel" ];
      shell = pkgs.bash;
    };
  };
}
