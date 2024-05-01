{ pkgs, ... }:

{
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.printing = {
    enable = true;
    drivers = [
      pkgs.canon-cups-ufr2
      pkgs.ptouch-driver
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
}