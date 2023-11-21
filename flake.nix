{
  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak = {
      url = "github:gmodena/nix-flatpak/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dotnet-sdks = {
      url = "path:/home/naharie/config/flakes/dotnet-sdks";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-flatpak, home-manager, nix-index-database, ... }@attrs: {
    # valorium here is the system hostname
    nixosConfigurations.valorium = nixpkgs.lib.nixosSystem {
      #system = "x86_64-linux";
      specialArgs = attrs;
      modules = [
        nix-flatpak.nixosModules.nix-flatpak
        home-manager.nixosModules.home-manager

        ./configuration.nix

        nix-index-database.nixosModules.nix-index
      ];
    };
  };
}