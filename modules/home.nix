{ inputs
, system
, host
, ...
}:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      inherit inputs;
      inherit system;
      inherit host;
    };

    users.naharie = import ../users/naharie;
    backupFileExtension = "backup";
  };
}
