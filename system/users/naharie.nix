{ pkgs
, ...
}:

let mur = import ../../packages { inherit pkgs; }; in

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
      commands = [ { command = "${mur.phone-proxy}/bin/phone-proxy"; options = [ "NOPASSWD" ]; } ];
    }
  ];
}
