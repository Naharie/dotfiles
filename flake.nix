{
  inputs = {    
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs";

    nix-flatpak.url = "github:gmodena/nix-flatpak/main";
    
    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    # Home Manager
    
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    #hyprland-nix.url = "github:spikespaz/hyprland-nix";

    # Packages

    eza.url = "github:eza-community/eza";
    eza.inputs.nixpkgs.follows = "nixpkgs";

    dotnet-sdks.url = "path:/home/naharie/config/flakes/dotnet-sdks";
    dotnet-sdks.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nix-flatpak, home-manager, nix-index-database, ... }@inputs: {
    # valorium here is the system hostname
    nixosConfigurations.valorium = nixpkgs.lib.nixosSystem {
      specialArgs = inputs;
      modules = [
        nix-flatpak.nixosModules.nix-flatpak
        nix-index-database.nixosModules.nix-index

        home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.naharie = import ./home/default.nix inputs;
        }

        ./configuration.nix
      ];
    };
  };
}