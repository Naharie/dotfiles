{ pkgs
, ...
}:


{
  programs.plasma.startup.startupScript = {
    ckb-next = {
      text = "${pkgs.ckb-next}/bin/ckb-next";
      priority = 8;
      runAlways = true;
    };

    # Not working for some reason
    proton-vpn = {
      text = "${pkgs.protonvpn-gui}/bin/protonvpn-app";
      priority = 8;
      runAlways = true;
    };
  };
}