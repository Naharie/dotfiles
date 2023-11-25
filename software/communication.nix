{ pkgs, ... }:

{
  packages = with pkgs; [
    discord
    skypeforlinux

    mumble
    murmur

    mediamtx
  ];

  services.zerotierone = {
    enable = true;
    joinNetworks = [ "a84ac5c10a50e083" ];
  };

  services.murmur.enable = true;
  services.murmur.hostName = "valorium";
  services.murmur.password = "valorium";
}