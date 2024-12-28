{
  inputs = {    
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #nixpkgs.url = "github:numtide/nixpkgs-unfree/nixos-unstable";

    nix-flatpak.url = "github:gmodena/nix-flatpak/main";

    # Home Manager
    
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Packages

    eza.url = "github:eza-community/eza";
    eza.inputs.nixpkgs.follows = "nixpkgs";

    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    affinity-nix.url = "github:mrshmllow/affinity-nix";
    affinity-nix.inputs.nixpkgs.url = "github:numtide/nixpkgs-unfree/nixos-unstable";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let specialArgs = {
    inputs = inputs;
    system = "x86_64-linux";
  }; in
  {
    nixosConfigurations.valorium = nixpkgs.lib.nixosSystem {
      specialArgs = specialArgs;
      modules = [
        ./hardware-configuration.nix
        
        ./modules/system.nix
        ./modules/boot-loader.nix

        inputs.nix-flatpak.nixosModules.nix-flatpak
        inputs.nix-index-database.nixosModules.nix-index

        home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = specialArgs;
            home-manager.users.naharie = ./home/default.nix;
            home-manager.backupFileExtension = "backup";
        }

        ./modules/hardware.nix
        ./modules/graphics.nix
        ./modules/networking.nix
        ./modules/sound.nix
        ./modules/desktop-environment.nix
        ./modules/environment-variables.nix
        ./modules/localization.nix
        ./modules/packages.nix
        ./modules/users.nix
      ];
    };
  };
}