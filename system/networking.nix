{ ...
}:

{
  networking = {
    hostName = "valorium";
    networkmanager.enable = true;
    firewall = {
      allowPing = true;
    };
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
}
