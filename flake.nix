{
  inputs = {    
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #nixpkgs-master.url = "github:nixos/nixpkgs";

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

  outputs = { self, nixpkgs, nix-flatpak, home-manager, nix-index-database, ... }@inputs:
  let specialArgs = {
    inputs = inputs;
    system = "x86_64-linux";
  }; in
  {
    # valorium here is the system hostname  
    nixosConfigurations.valorium = nixpkgs.lib.nixosSystem {
      specialArgs = specialArgs;
      modules = [
        nix-flatpak.nixosModules.nix-flatpak
        nix-index-database.nixosModules.nix-index

        home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.naharie = ./home/default.nix;
        }

        ./hardware-configuration.nix

        ./hardware/boot-loader.nix
        ./hardware/general.nix
        ./hardware/graphics.nix
        ./hardware/networking.nix
        ./hardware/sound.nix

        ./modules/desktop-environment.nix
        ./modules/environment-variables.nix
        ./modules/localization.nix
        ./modules/packages.nix
        ./modules/users.nix
        ./modules/system.nix
      ];
    };
  };
}