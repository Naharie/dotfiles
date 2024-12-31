{ pkgs
, ...
}:

let mur = import ../../packages { inherit pkgs; }; in

{
  environment.systemPackages = with pkgs; [
    mur.proton-ge
    steam-run
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
}
