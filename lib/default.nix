{ pkgs
, lib
}:

{
  maintainers = import ./maintainers.nix;
  pin = import ./pin.nix;
  gatherImports = import ./gatherImports.nix { inherit lib; };
  sandbox = import ./sandbox.nix { inherit pkgs; inherit lib; };
}