{ pkgs
, ...
}:

{
  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
    jellyfin-media-player
  ];

  services.jellyfin = {
    enable = true;
    openFirewall = true;

    user = "naharie";
    
    logDir = "/home/naharie/.local/share/jellyfin/logs";
    cacheDir = "/home/naharie/.local/share/jellyfin/cache";
    dataDir = "/home/naharie/.local/share/jellyfin/data";
    configDir = "/home/naharie/.local/share/jellyfin/config";
  };

  # Shenanigans to try and get Jellyfin to not start until my user account is loaded.
  systemd.services.jellyfin = {
    after = [ "home-manager-naharie.service" ];
  };
}