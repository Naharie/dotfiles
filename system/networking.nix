{ ...
}:

{
  networking = {
    hostName = "valorium";
    networkmanager.enable = true;
    firewall = {
      allowPing = true;
      allowedTCPPorts = [ 80 25565 ];
      allowedUDPPortRanges = [
        { from = 19132; to = 19132; }
      ];
    };
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
}
