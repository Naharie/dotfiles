{
    inputs = {        
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        nix-flatpak.url = "github:gmodena/nix-flatpak/main";

        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        plasma-manager = {
            url = "github:nix-community/plasma-manager";
            inputs.home-manager.follows = "home-manager";
        };

        eza.url = "github:eza-community/eza";

        nix-index-database.url = "github:Mic92/nix-index-database";

        affinity-nix.url = "github:mrshmllow/affinity-nix";
        affinity-nix.inputs.nixpkgs.url = "github:numtide/nixpkgs-unfree/nixos-unstable";

        zen-browser.url = "github:0xc000022070/zen-browser-flake";
    };

    outputs = { self, nixpkgs, home-manager, plasma-manager, ... }@inputs:
    
    let
        system = "x86_64-linux";
        specialArgs = {
            inputs = inputs;
            inherit system;
        };
    in
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
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        
                        extraSpecialArgs = specialArgs;

                        users.naharie = import ./users/naharie;
                        backupFileExtension = "backup";
                    };
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