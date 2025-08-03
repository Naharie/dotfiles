{ pkgs
, inputs
, ...
}:

{
  home.packages = [
    inputs.nixpkgs-stable.legacyPackages.${pkgs.system}.protonvpn-gui
  ];
}