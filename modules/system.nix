{ system, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = system;

  system.stateVersion = "23.05";

  nixpkgs.config.permittedInsecurePackages = [ ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
