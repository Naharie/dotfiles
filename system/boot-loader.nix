{ ...
}:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # For MakeMKV to detect the optical drive
  boot.kernelModules = [ "sg" ];
}
