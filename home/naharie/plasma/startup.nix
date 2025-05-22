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
  };
}