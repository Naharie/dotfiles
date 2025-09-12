{ inputs
, ...
}:

{
  imports = [ inputs.tuxedo-nixos.nixosModules.default ];

  hardware = {
    tuxedo-drivers.enable = true;
    tuxedo-control-center.enable = true;
  };

  # Let TUXEDO Control Center handle CPU frequencies
  services.power-profiles-daemon.enable = false;

  boot = {
    kernelParams = [
      "acpi.ec_no_wakeup=1" # Fixes ACPI wakeup issues
      "amdgpu.dcdebugmask=0x10" # Fixes Wayland slowdowns/freezes
    ];
  };
}
