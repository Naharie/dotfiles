{ pkgs
, ...
}:


let mur = import ../../../packages { inherit pkgs; }; in

{
  programs.plasma.startup.startupScript = {
    phone-proxy = {
      text = "${mur.phone-proxy}/bin/phone-proxy";
      priority = 8;
      runAlways = true;
    };
    ckb-next = {
      text = "${pkgs.ckb-next}/bin/ckb-next";
      priority = 8;
      runAlways = true;
    };
  };
}