{ pkgs
, inputs
, ...
}:

let mur = inputs.self.packages.${pkgs.system}; in

{
  systemd.services.phone-proxy = {
    enable = false;
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