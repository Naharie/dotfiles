{ lib, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nixpkgs.hostPlatform = "x86_64-linux";

  system.stateVersion = "23.05";

  nixpkgs.config.permittedInsecurePackages = [ ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
