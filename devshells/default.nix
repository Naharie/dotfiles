{ pkgs
, ...
}:

{
  default = import ./nix.nix pkgs;
  nix = import ./nix.nix pkgs;
}