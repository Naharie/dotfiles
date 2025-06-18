{ inputs
, valLib
, ...
}:

# To generate an auto config (useful for diffing):
# nix run github:nix-community/plasma-manager

{
  imports = [ inputs.plasma-manager.homeManagerModules.plasma-manager ] ++ (valLib.gatherImports ./.);

  programs.plasma = {
    enable = true;
    overrideConfig = true;
    immutableByDefault = true;
  };
}
