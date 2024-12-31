[
  ./boot-loader.nix
  ./desktop-environment-plasma.nix
  ./desktop-environment.nix
  ./environment-variables.nix
  ./graphics.nix
  ./hardware-configuration.nix
  ./hardware-corsair.nix
  ./home.nix
  ./localization.nix
  ./networking.nix
  ./nixpkgs.nix
  ./sound.nix
]
++
builtins.concatLists [
  (import ./programs)
  (import ./services)
  (import ./users)
]