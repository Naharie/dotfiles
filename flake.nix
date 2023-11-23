{
  inputs = {
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    nix-flatpak.url = "github:gmodena/nix-flatpak/main";

    dotnet-sdks.url = "path:/home/naharie/config/flakes/dotnet-sdks";
    dotnet-sdks.inputs.nixpkgs.follows = "nixpkgs";
    
    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    # Packages
    eza.url = "github:eza-community/eza";
    eza.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nix-flatpak, home-manager, nix-index-database, ... }@attrs: {
    # valorium here is the system hostname
    nixosConfigurations.valorium = nixpkgs.lib.nixosSystem {
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