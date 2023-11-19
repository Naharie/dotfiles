{ ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Before using this check if hardware.module-name.enable exists.
  #boot.kernelModules = [ "kernel-module-goes-here" ];

  # Extra flags like the one Isaiah needs.
  # boot.kernelParams = [ "no-aer" ]
}