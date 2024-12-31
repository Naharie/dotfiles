{
    outputs = inputs@{ self, nixpkgs, ... }:
    
    let
        host = "valorium";
        system = "x86_64-linux";
        specialArgs = {
            inputs = inputs;
            inherit system;
            inherit host;
        };
    in

    {
        nixosConfigurations.${host} = nixpkgs.lib.nixosSystem {
            specialArgs = specialArgs;

            modules = [
                ./apps/steam.nix

                ./modules/users/naharie.nix
                ./modules/users/tiredpaperartist.nix

                ./modules/boot-loader.nix
                ./modules/desktop-environment-plasma.nix
                ./modules/desktop-environment.nix
                ./modules/environment-variables.nix
                ./modules/graphics.nix
                ./modules/hardware-configuration.nix
                ./modules/hardware-corsair.nix
                ./modules/home.nix
                ./modules/localization.nix
                ./modules/networking.nix
                ./modules/sound.nix
                ./modules/system.nix
            ];
        };
    };

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
}