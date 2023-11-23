{ pkgs, eza, ... }:

{
  packages = with pkgs; [
    bat
    eza.packages.${system}.default
  ];
}