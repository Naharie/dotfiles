{ pkgs
, inputs
, ...
}:


{
  programs.plasma.startup.startupScript = {
    tuxedo-control-center = {
      text = "${inputs.tuxedo-nixos.packages.${pkgs.system}.default}/bin/tuxedo-control-center";
      priority = 8;
      runAlways = true;
    };
  };
}