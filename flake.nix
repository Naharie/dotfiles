{
  inputs = {    
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nix-flatpak.url = "github:gmodena/nix-flatpak/main";

    dotnet-sdks.url = "path:/home/naharie/config/flakes/dotnet-sdks";
    dotnet-sdks.inputs.nixpkgs.follows = "nixpkgs";
    
    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    plasma-manager.url = "github:pjones/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";

    # Packages
    eza.url = "github:eza-community/eza";
    eza.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nix-flatpak, home-manager, plasma-manager, nix-index-database, ... }@inputs: {
    # valorium here is the system hostname
    nixosConfigurations.valorium = nixpkgs.lib.nixosSystem {
      specialArgs = inputs;
      modules = [
        nix-flatpak.nixosModules.nix-flatpak
        nix-index-database.nixosModules.nix-index

        home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.naharie = import ./modules/home.nix inputs;
          }

        ./configuration.nix
      ];
    };
  };
}