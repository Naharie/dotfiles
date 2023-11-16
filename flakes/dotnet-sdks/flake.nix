{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      packages.combinedSdk = pkgs.buildEnv {
        name = "combinedSdk";
        paths = [
          (with pkgs.dotnetCorePackages;
            combinePackages [
              sdk_6_0
              sdk_7_0
            ])
        ];
      };
    });
}
