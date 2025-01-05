{ pkgs
, ...
}:

let
  mur = import ../../packages { inherit pkgs; };
in

{
  systemd.services.phone-proxy = {
    enable = true;
    name = "phone-proxy.service";
    description = "Proxy all network traffic through the phone's data plan";

    after = ["network.target"];
    wantedBy = ["multi-user.target"];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${mur.phone-proxy}/bin/phone-proxy";
      Restart = "always";
      RestartSec = 1;
    };
  };
}