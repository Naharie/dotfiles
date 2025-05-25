{ pkgs
, ...
}:

{
  environment.systemPackages = with pkgs; [
    proton-ge-custom
    steam-run
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
}
