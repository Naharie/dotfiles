{ pkgs
, inputs
, ...
}:

{
  home.packages = [
    inputs.nixpkgs-stable.legacyPackages.${pkgs.system}.jetbrains.rider
    #inputs.nixpkgs-stable.legacyPackages.${pkgs.system}.jetbrains.clion
    #inputs.nixpkgs-stable.legacyPackages.${pkgs.system}.jetbrains.rust-rover
  ];
}