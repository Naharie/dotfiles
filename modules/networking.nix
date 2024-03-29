{ ... }:

{
  networking.hostName = "valorium";

  # Enable networking
  networking.networkmanager.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  networking.firewall.allowPing = true;

   networking.firewall = { 
    enable = true;
    allowedTCPPortRanges = [ 
      # KDE Connect
      { from = 1714; to = 1764; }
    ];  
    allowedUDPPortRanges = [ 
      # KDE Connect
      { from = 1714; to = 1764; }
    ];  
  };  
}