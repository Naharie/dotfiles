{ pkgs }:

{
  steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = false;
  };

  packages = with pkgs; [
    steam-run
    minecraft
  ];
}