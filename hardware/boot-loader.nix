{ ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  #boot.kernelModules = [ "i2c-dev" ];

  # Extra flags like the one Isaiah needs.
  # boot.kernelParams = [ "no-aer" ]
}