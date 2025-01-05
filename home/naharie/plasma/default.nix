{ inputs
, ...
}:

# To generate an auto config (useful for diffing):
# nix run github:nix-community/plasma-manager

{
  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
    
    ./appearance.nix
    ./display.nix
    ./input.nix
    ./layout.nix
    ./night-light.nix
    ./notifications.nix
    ./screen-locking.nix
    ./shortcuts.nix
    ./startup.nix
  ] ++ import ./programs;

  programs.plasma = {
    enable = true;
    overrideConfig = true;
    immutableByDefault = true;
  };
}
