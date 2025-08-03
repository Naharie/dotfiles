{ pkgs
, inputs
, ...
}:

{
  imports = [ inputs.self.nixosModules.amdgpu ];

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

  # For asynchronous reprojection support in Steam VR
  custom.amdgpu.kernelModule.patches = [
    (pkgs.fetchpatch {
      name = "cap_sys_nice_begone.patch";
      url = "https://github.com/Frogging-Family/community-patches/raw/master/linux61-tkg/cap_sys_nice_begone.mypatch";
      hash = "sha256-Y3a0+x2xvHsfLax/uwycdJf3xLxvVfkfDVqjkxNaYEo=";
    })
  ];
}
