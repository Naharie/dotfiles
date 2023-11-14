{ pkgs, ... }:

{
  packages = with pkgs; [
    discord
    skypeforlinux
  ];
}