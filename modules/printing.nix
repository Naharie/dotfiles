{ pkgs, ... }:

let nur = import ../packages { inherit pkgs; }; in
{
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.printing = {
    enable = true;
    drivers = [
      #pkgs.canon-cups-ufr2
      nur.canon-cups-ufr2
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