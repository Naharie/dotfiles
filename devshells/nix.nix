{ pkgs
, ...
}:

{
  packages = with pkgs; [
    nixpkgs-fmt
  ];
}