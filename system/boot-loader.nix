{ ...
}:

{
  boot.loader.systemd-boot = {
    enable = true;
    windows = {
      "11" = {
        title = "Windows 11";
        efiDeviceHandle = "M2_2";
        sortKey = "z_windows_11";
      };
    };
  };
  boot.loader.efi.canTouchEfiVariables = true;

  # For MakeMKV to detect the optical drive
  boot.kernelModules = [ "sg" ];
}
