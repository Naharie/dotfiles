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

  environment.sessionVariables.STEAM_EXTRA_COMPAT_TOOLS_PATHS = "${pkgs.proton-ge-custom}";

  hardware.steam-hardware.enable = true;

  boot = {
    kernel.sysctl = {
      # SteamOS/Fedora default, can help with performance.
      "vm.max_map_count" = 2147483642;
    };
  };
}
