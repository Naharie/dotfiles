{ config, pkgs, ... }:

{
  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      gutenprint
      canon-cups-ufr2
      cups-filters
    ];
    browsing = true;
    browsedConf = ''
BrowseDNSSDSubTypes _cups,_print
BrowseLocalProtocols all
BrowseRemoteProtocols all
CreateIPPPrinterQueues All

BrowseProtocols all
    '';
  };

  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
  };

  #networking.hosts = {
  #  "192.168.1.137" = [ "Canon60ea6f.local" "Canon60ea6f" ];
  #};
}