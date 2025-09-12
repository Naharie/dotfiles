{
  outputs = inputs@{ flake-parts, nixpkgs, ... }:
    let valLib = import ./lib { lib = nixpkgs.lib; }; in

    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      imports = [ inputs.devshell.flakeModule ];

      flake = {
        nixosConfigurations.valorium =  nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            inherit valLib;
          };
          modules = valLib.gatherImports ./system;
        };

        valLib = import ./lib { lib = nixpkgs.lib; };

        nixosModules = {};

        homeManagerModules = {
          fsearch = import ./modules/home-manager/fsearch.nix;
        };
      };

      perSystem = { pkgs, ... }: {
        packages = import ./packages { inherit pkgs; lib = nixpkgs.lib; };
      };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:numtide/nixpkgs-unfree/nixos-24.05";
    nixpkgs-unfree.url = "github:numtide/nixpkgs-unfree/nixos-unstable";

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    flake-parts.url = "github:hercules-ci/flake-parts";
    devshell.url = "github:numtide/devshell";

    nix-flatpaks.url = "github:in-a-dil-emma/declarative-flatpak/stable-v3";

    nix-index-database.url = "github:Mic92/nix-index-database";

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.home-manager.follows = "home-manager";
    };

    affinity-nix.url = "github:mrshmllow/affinity-nix";
    affinity-nix.inputs.nixpkgs.follows = "nixpkgs-unfree";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nix-vscode-extensions.inputs.nixpkgs.follows = "nixpkgs";

    nix-alien.url = "github:thiagokokada/nix-alien";

    tuxedo-nixos.url = "github:sund3RRR/tuxedo-nixos";  
  };
}
