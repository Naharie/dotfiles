{ ...
}:

{
  boot.loader.systemd-boot = {
    enable = true;
    windows = {
      "11" = {
        title = "Windows 11";
        efiDeviceHandle = "HD2e";
        sortKey = "z_windows_11";
      };
    };

    edk2-uefi-shell = {
      enable = true;
      sortKey = "z_edk2";
    };
  };
  boot.loader.efi.canTouchEfiVariables = true;
}
