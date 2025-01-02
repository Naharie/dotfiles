{ pkgs
, ...
}:

{
  default = import ./nix.nix pkgs;
  nix = import ./nix.nix pkgs;
  js = import ./js.nix pkgs;
  dotnet = import ./dotnet.nix pkgs;
}