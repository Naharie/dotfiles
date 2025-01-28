{ inputs
, system
, ...
}:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = { inherit inputs; inherit system; };

    users.naharie = import ../home/naharie;
    users.tiredpaperartist = import ../home/tiredpaperartist;

    backupFileExtension = "backup";
  };
}