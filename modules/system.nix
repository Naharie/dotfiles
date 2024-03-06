{ ... }:

{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "x86_64-linux";

  system.stateVersion = "23.05";

  nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
