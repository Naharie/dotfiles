{
  inputs = {
    home-manager.url = "github:nix-community/home-manager";
    nix-flatpak.url = "github:gmodena/nix-flatpak/main";
    dotnet-sdks.url = "path:/home/naharie/config/flakes/dotnet-sdks";
  };

  outputs = { self, nixpkgs, nix-flatpak, home-manager, ... }@attrs: {
    # valorium here is the system hostname
    nixosConfigurations.valorium = nixpkgs.lib.nixosSystem {
      #system = "x86_64-linux";
      specialArgs = attrs;
      modules = [
        nix-flatpak.nixosModules.nix-flatpak
        home-manager.nixosModules.home-manager
        ./configuration.nix
      ];
    };
  };
}