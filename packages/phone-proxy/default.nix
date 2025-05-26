{ pkgs
, ...
}:

pkgs.writeShellApplication {
  name = "phone-proxy";
  runtimeInputs = with pkgs; [ sysctl iproute2 networkmanager tun2socks ];
  text = builtins.readFile ./proxy.sh;
}