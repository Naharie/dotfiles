{ inputs
, ...
}:

# To generate an auto config (useful for diffing):
# nix run github:nix-community/plasma-manager

{
  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
    ./layout.nix
    ./input.nix
    ./appearance.nix
    ./shortcuts.nix
    ./display.nix
    ./night-light.nix
    ./notifications.nix
    ./startup.nix
  ] ++ import ./programs;

  programs.plasma = {
    enable = true;
    overrideConfig = true;
    immutableByDefault = true;
  };
}
