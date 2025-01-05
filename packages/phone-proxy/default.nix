{ pkgs
, ...
}:

pkgs.writeShellApplication {
  name = "phone-proxy";
  runtimeInputs = with pkgs ;[ tun2socks ];
  text = builtins.readFile ./proxy.sh;
}