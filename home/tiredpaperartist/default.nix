{ pkgs
, inputs
, ...
}:

{
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
  ];

  programs.plasma = {
    enable = true;

    startup.startupScript = {
      ckb-next = {
        text = "${pkgs.ckb-next}/bin/ckb-next";
        priority = 8;
        runAlways = true;
      };
    };
  };

  home.packages = with pkgs; [ brave ];
}